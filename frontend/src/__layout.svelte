<script>
  import { init, dictionary, getLocaleFromNavigator } from 'svelte-i18n';
  import { t } from 'svelte-i18n';


  // Import translation files
  import en from './i18n/en.json';
  import fr from './i18n/fr.json';


      // Initialize the i18n library
  init({
    fallbackLocale: 'en',
    initialLocale: (typeof navigator !== 'undefined') ? getLocaleFromNavigator().substring(0,2): "en"
  });

    dictionary.set({ en, fr });
</script>

<svelte:head>
  <title>{$t('page.title')}</title>
</svelte:head>

<!-- Entire page is rendered inside the slot -->
<slot />

<style lang="scss">
  @import './global.scss';

</style>
