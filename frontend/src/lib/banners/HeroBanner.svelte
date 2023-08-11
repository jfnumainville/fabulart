<script>
    import Button from '../buttons/Button.svelte';
</script>

<div class="container">
    <div class="hero-banner">
        <div class="text-wrapper">
            <h2 class="title">Create Amazing Illustrated Stories with AI!</h2>
            <p class="subtitle">Unleash your creativity and bring your stories to life with AI-generated images.</p>
            <footer>
                <Button url="#sub-banner-section" bgColor="bg-peach">Start Now</Button>
            </footer>
        </div>
        <img src="/hero-banner.png" alt="a kid playing a computer game.">
    </div>
</div>

<style lang="scss">
    .container {
        width: 80%;
        min-width: 600px;
        max-width: 1100px;
        margin: 0 auto;
    }

     .hero-banner {
        position: relative;
        width: 100%;
        height: 600px;
        background-color: #ffe8c1;
        padding: 3rem;
        border-radius: 5rem 0.5rem 5rem 0.5rem;

        display: flex;
        align-items: center;
        justify-content: center;
        gap: 2rem;
    }

    img {
        width: 55%;
        height: 100%;
        border-radius: 5rem 0.5rem;
        box-shadow: 0 4px 8px #00000020;
        object-fit: cover;
        object-position: center;
    }


    .text-wrapper {
        position: relative;
        padding: 1rem;
        height: 100%;
        width: 45%;
        min-width: 200px;
    }

    .title {
        font-size: 2.25rem;
        margin: 5rem 0 1rem;
    }

    .subtitle {
        font-size: 1.25rem;
        font-weight: lighter;
    }
    
    footer {
        position: absolute;
        bottom: 1rem;
        left: 50%;
        transform: translateX(-50%);
        width: 50%;
    }
    
</style>