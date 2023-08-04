<script>
    import Button from '../buttons/Button.svelte';
</script>

<div class="container">
    <div class="banner">
        <div class="text-wrapper">
            <h2 class="title">Unleash your creativity effortlessly!</h2>
            <p class="subtitle">Simply provide an image description, craft your story, and continue the process for as many pages as desired.</p>
        </div>
        <img src="/sub-banner.png" alt="a kid playing a computer game.">
    </div>
    
    <section class="featured-section">
        <h2 class="featured-section-title">Featured stories</h2>
        <div class="stories-grid">
            <div class="story-wrapper">
                <!-- svelte-ignore a11y-img-redundant-alt -->
                <img src="https://source.unsplash.com/random/200" alt="image of story">
                <p>The Super Story</p>
            </div>

            <div class="story-wrapper">
                <!-- svelte-ignore a11y-img-redundant-alt -->
                <img src="https://source.unsplash.com/random/201" alt="image of story">
                <p>The Amazing Story</p>
            </div>

            <div class="story-wrapper">
                <!-- svelte-ignore a11y-img-redundant-alt -->
                <img src="https://source.unsplash.com/random/199" alt="image of story">
                <p>The Great Story</p>
            </div>
        </div>
        <footer>
            <Button url="#new-story-section" bgColor="bg-peach">Get started</Button>
        </footer>
    </section>
</div>

<style lang="scss">
    .container {
        width: 80%;
        min-width: 600px;
        max-width: 1100px;
        margin: 0 auto;
    }

     .banner {
        position: relative;
        width: 100%;
        height: 400px;
        border-radius: 0.5rem;
        margin-bottom: 5rem;

        display: flex;
        align-items: center;
        justify-content: center;
        gap: 2rem;
    }

    img {
        width: 60%;
        height: 100%;
        border-radius: 0.5rem;
        box-shadow: 0 4px 8px #00000020;
        object-fit: cover;
        object-position: center;
    }


    .text-wrapper {
        position: relative;
        padding: 1rem;
        height: 100%;
        width: 40%;
        min-width: 200px;
    }

    .title {
        font-size: 2rem;
        margin-top: 2.55rem;
        margin-bottom: 1.5rem;
    }

    .subtitle {
        font-size: 1.125rem;
        font-weight: lighter;
        margin-bottom: 8rem;
    }
    
    .stories-grid {
        margin-bottom: 5rem;

        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        align-items: center;
    }

    .story-wrapper {
        position: relative;
        text-align: center;
        height: 200px;
    }

    .featured-section-title {
        text-align: center;
        margin-bottom: 2rem;
    }

    footer {
        width: 10rem;
        text-align: center;
        margin: 0 auto;
    }
</style>