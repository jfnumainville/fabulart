<script>
    import Layout from '../__layout.svelte';
    import Navbar from '../lib/Navbar.svelte';
    import NewStory from '../lib/storyPages/NewStory.svelte';
    import NewPage from '../lib/storyPages/NewPage.svelte';
    import HeroBanner from '../lib/banners/HeroBanner.svelte';
    import SubBanner from '../lib/banners/SubBanner.svelte';
    import { t } from 'svelte-i18n';
    const user = {
        username: 'Jacob#3254',
        password: 'password',
        email: 'jacob@email.com',
        stories: [],
        featuredStories: []
    }


</script>

<!-- TODO: We should have cartoon avatars for the kids to select since they won't use their photos.
It could be fun for them to pick a "pirate" avatar, which has no effect on the rest of the web app -->

<svelte:component this={Layout}>
    <section>
        <HeroBanner />
    </section>
    <section id="sub-banner-section" class="sub-banner-section">
        <div class="section-wave-top">
            <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
                <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="shape-fill"></path>
            </svg>
        </div>
        <div class="section-wave-bottom">
            <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
                <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="shape-fill"></path>
            </svg>
        </div>
        <SubBanner />
    </section>
    <section id="new-story-section" class="new-story-section">
        <h2>{$t('+page.step1')}</h2>
        <NewStory />
    </section>
    <section class="new-page-section">
        <h2>{$t('+page.step2')}</h2>
        <NewPage />
    </section>
    <footer>
        <div class="section-wave-top">
            <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
                <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="shape-fill"></path>
            </svg>
        </div>
    </footer>

</svelte:component>


<style lang="scss">
    section {
        margin-bottom: 15rem;
    }

    .sub-banner-section {
        position: relative;
        background-color: #ffe8c1;
        padding: 10rem 0;
    }

    h2 {
        text-align: center;
        margin-bottom: 1rem;
    }

    footer {
        position: relative;
        background-color: var(--yellow);
        padding: 10rem 0;
    }

    /* Curvy section */
    .section-wave-top {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        overflow: hidden;
        line-height: 0;
    }

    .section-wave-top svg {
        position: relative;
        display: block;
        width: calc(123% + 1.3px);
        height: 113px;
    }

    .section-wave-top .shape-fill {
        fill: #fff7f7;
    }

    .section-wave-bottom {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        overflow: hidden;
        line-height: 0;
        transform: rotate(180deg);
    }

    .section-wave-bottom svg {
        position: relative;
        display: block;
        width: calc(123% + 1.3px);
        height: 113px;
    }

    .section-wave-bottom .shape-fill {
        fill: #fff7f7;
    }
</style>
