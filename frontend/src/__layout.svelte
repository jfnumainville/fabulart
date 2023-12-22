<script>
  import { onMount } from 'svelte';
  import Navbar from './lib/Navbar.svelte';
  import { init, dictionary, getLocaleFromNavigator, locale } from 'svelte-i18n';
  import en from './i18n/en.json';
  import fr from './i18n/fr.json';
  import { t } from 'svelte-i18n';
  import 'bootstrap/dist/css/bootstrap.min.css';
  import 'bootstrap-icons/font/bootstrap-icons.css';


  let selectedLang;

  onMount(() => {
    if (typeof localStorage !== 'undefined') {
      selectedLang = localStorage.getItem('language') || getLocaleFromNavigator().substring(0, 2);
    }

    //This is for preventing the language dropdown to be empty when the browser language isn't English or French.
    //TODO: Need to exclude Spanish from this condition when adding this language to  the translation file
    if (!['fr', 'en'].includes(selectedLang)) {
      selectedLang = 'en';
    }

    setLanguage(selectedLang);
  });

  function setLanguage(lang) {
    locale.set(lang);
    if (typeof localStorage !== 'undefined') {
      localStorage.setItem('language', lang);
    }
    else
    localStorage.setItem('language', en)
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
