<script context="module">
	import { listen } from "svelte/internal";


  export async function load({ params }) {
    const { userId, storyId, pageId } = params;

    let pageIsnew = (pageId == 'new')

    let pageData;
    if (pageIsnew) {
      // If it's not 'new', fetch the existing page data
      const res = await fetch(`/api/users/${userId}/stories/${storyId}/pages/${pageId}`);
      pageData = await res.json();
    }

    return {
      props: {
        userId,
        storyId,
        pageId,
        pageData: pageData || { page_text: '', image_prompt: '' } // if new, create an empty pageData
      }
    };
  }
</script>

<script>
  export let userId;
  export let storyId;
  export let pageId;
  export let pageData;

  const savePage = async () => {
    // Depending on whether it's 'new' or not, we use POST or PUT
    const method = pageId === 'new' ? 'POST' : 'PUT';
    const res = await fetch(`/api/users/${userId}/stories/${storyId}/pages/${pageId}`, {
      method,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(pageData)
    });

    // Handle responses...
  };
</script>

<main>
  <form on:submit|preventDefault={savePage}>
    <input type="text" bind:value={pageData.page_text}>
    <input type="text" bind:value={pageData.image_prompt}>
    <button type="submit">Save</button>
  </form>

  <!-- Show image if exists -->
  {#if pageData.image_url}
    <img src={pageData.image_url} alt={pageData.image_prompt}>
  {/if}
</main>
