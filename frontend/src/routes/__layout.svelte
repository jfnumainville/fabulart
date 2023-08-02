<svelte:head>
  <title>Fabulart Layout</title>
  <link rel="stylesheet" href="/global.css" hydrate />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,700;1,300;1,400&display=swap" rel="stylesheet">
</svelte:head>

<!-- Entire page is rendered inside the slot -->
<slot />

<style lang="scss">
  @import '../global.scss';

  /* font wasn't applying to form textarea fields */
  :global(textarea) {
    font-family: 'Ubuntu';
  }
</style>
