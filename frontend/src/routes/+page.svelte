<script>
    import Layout from '../__layout.svelte';
    import Navbar from '../lib/Navbar.svelte';
</script>

<svelte:head>
    <title>Fabulart | Create your own story with AI generated images</title>
</svelte:head>

<!-- TODO: We should have cartoon avatars for the kids to select since they won't use their photos.
It could be fun for them to pick a "pirate" avatar, which has no effect on the rest of the web app -->

<svelte:component this={Layout}>
    <Navbar />
    <h1>Hello World</h1>
    
</svelte:component>


<style>
    
</style>