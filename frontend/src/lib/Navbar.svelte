<script>
    import Avatar from './avatars/Avatar.svelte';
    export let selectedLang;
    export let setLanguage;
</script>

<nav>
    <div class="nav-logo-wrapper">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="book-icon">
            <path stroke-linecap="round" stroke-linejoin="round" d="M12 6.042A8.967 8.967 0 006 3.75c-1.052 0-2.062.18-3 .512v14.25A8.987 8.987 0 016 18c2.305 0 4.408.867 6 2.292m0-14.25a8.966 8.966 0 016-2.292c1.052 0 2.062.18 3 .512v14.25A8.987 8.987 0 0018 18a8.967 8.967 0 00-6 2.292m0-14.25v14.25" />
          </svg>
        <h1 class="nav-title">Fabulart</h1>
    </div>
    <div class="nav-social-wrapper">
      <span class="language-icon">🌍</span>
      <select bind:value={selectedLang} on:change={() => setLanguage(selectedLang)}>
        <option value="en">English</option>
        <option value="fr">Français</option>
      </select>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="share-icon">
            <path stroke-linecap="round" stroke-linejoin="round" d="M7.217 10.907a2.25 2.25 0 100 2.186m0-2.186c.18.324.283.696.283 1.093s-.103.77-.283 1.093m0-2.186l9.566-5.314m-9.566 7.5l9.566 5.314m0 0a2.25 2.25 0 103.935 2.186 2.25 2.25 0 00-3.935-2.186zm0-12.814a2.25 2.25 0 103.933-2.185 2.25 2.25 0 00-3.933 2.185z" />
        </svg>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="home-icon">
            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 12l8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25" />
        </svg>
        <Avatar />
    </div>
</nav>

<style lang="scss">
    nav {
        background-color: var(--yellow);
        padding: 1.75rem 1rem;
        margin-bottom: 10rem;
        width: 100%;
        box-shadow: 0 4px 8px #00000016;

        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .nav-logo-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 0.125rem;
    }

    .nav-social-wrapper {
        display: flex;
        justify-content: space-evenly;
        align-items: center;
        gap: 1rem;
    }

    .book-icon,
    .share-icon,
    .home-icon {
        fill: none;
        stroke-width: 1.5;
        stroke: var(--primary-grey);
        height: 2rem;
    }

    select {
        background-color: var(--yellow);
        color: var(--primary-grey);
        font-family: sans-serif, 'Ubuntu';
        font-size: 1.1rem;
        padding: 0.5rem 1rem;
        border: 1px solid var(--primary-grey);
        cursor: pointer;
        box-shadow: 0 2px 4px #00000016;
        appearance: none;
        border-radius: 8px;
    }

    .language-icon {
        cursor: pointer;
    }

</style>
