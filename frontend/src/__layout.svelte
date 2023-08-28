<script>
  import Navbar from './lib/Navbar.svelte'; // Import Navbar component
  import { init, dictionary, getLocaleFromNavigator, locale } from 'svelte-i18n';
  import en from './i18n/en.json';
  import fr from './i18n/fr.json';
  import { t } from 'svelte-i18n';

  let selectedLang;

  if (typeof localStorage !== 'undefined') {
    selectedLang = localStorage.getItem('language');
  }

  if (!selectedLang && typeof navigator !== 'undefined') {
    const navigatorLang = getLocaleFromNavigator();
    selectedLang = navigatorLang ? navigatorLang.substring(0, 2) : 'en';
  } else {
    selectedLang = 'en';
  }

  function setLanguage(lang) {
    locale.set(lang);
    if (typeof localStorage !== 'undefined') {
      localStorage.setItem('language', lang);
    }
  }

  init({
    fallbackLocale: 'en',
    initialLocale: selectedLang
  });

  dictionary.set({ en, fr });
</script>

<Navbar {selectedLang} {setLanguage} />

<svelte:head>
  <title>{$t('page.title')}</title>
</svelte:head>

<slot />

<style lang="scss">
  @import './global.scss';
</style>
