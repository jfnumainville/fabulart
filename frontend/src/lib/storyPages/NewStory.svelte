<script>
    import Button from '../buttons/Button.svelte';
    import { t } from 'svelte-i18n';

    // Use import.meta.env to access environment variables set in vite.config.js
    const apiEndpoint = process.env.API_ENDPOINT;
    let storyTitle = '';
    let imgDescription = '';
    let imageUrl = null; // Initialize as null

    async function createStory() {
        const userId = 1; // Since user management isn't in place yet
        const url = `${apiEndpoint}/users/${userId}/stories`;
        const payload = {
          title: storyTitle,
          style: "Neo", // TODO: Remove hardcoded value
          image_prompt: imgDescription,
      };

      const response = await fetch(url, {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json'
          },
          body: JSON.stringify(payload)
      });

      if (response.status === 201) {
          const data = await response.json();
          imageUrl = data.image_url; // Update image URL only if API call is successful
          console.log("Story created, ID:", data.id);
      } else {
          console.log(`Failed to create story: ${response.statusText}`);
      }
  }
</script>

<div class="container">
    <div class="new-story-card">
        <img src={imageUrl ? imageUrl : '/story-template.png'} alt={imgDescription? imgDescription : "Placeholder story image"}>
        <div class="page-text-wrapper">
            <form>
                <div class="form-group">
                    <label for="story-title">{$t('NewStory.story_title')}</label>
                    <input bind:value={storyTitle} id="story-title" name="story-title" type="text" placeholder={$t('NewStory.story_placeholder')}>
                </div>
                <div class="form-group">
                    <label for="img-description">{$t('NewStory.cover_picture')}</label>
                    <textarea bind:value={imgDescription} name="img-description" id="img-description" placeholder={$t('NewStory.picture_placeholder')}></textarea>
                </div>
            </form>
            <footer>
                <Button on:click={createStory} bgColor="bg-peach">{$t('NewStory.create_button')}</Button>
            </footer>
        </div>
    </div>
</div>

<style lang="scss">
    .container {
        width: 80%;
        min-width: 600px;
        max-width: 1100px;
        margin: 0 auto;
    }

     .new-story-card {
        position: relative;
        width: 100%;
        height: 600px;
        box-shadow: 0 4px 8px #00000020;
        border-radius: 0.5rem;

        display: flex;
        align-items: center;
        justify-content: center;
    }

    img {
        height: 100%;
        width: 55%;
        min-width: 55%;
        border-radius: 0.5rem 0 0 0.5rem;
        object-fit: cover;
        object-position: center;
    }


    .page-text-wrapper {
        position: relative;
        background-color: #fffaf7;
        padding: 2rem;
        height: 100%;
        width: 45%;
        min-width: 45%;
        min-width: 300px;
        border-radius: 0 0.5rem 0.5rem 0;
    }

    .form-group {
        width: 100%;
        margin-bottom: 2rem;
    }

    label {
        font-weight: bold;
        font-size: 0.9rem;
    }

    .form-group input,
    .form-group textarea {
        width: 100%;
        padding: 0.5rem;
        border-radius: 0.5rem;
        border: 1px solid #d1d5db;
        box-shadow: 0 4px 8px #00000015;
        resize: none;

        &:focus {
            outline: none;
            border: 2px solid var(--pink);

        }
    }

    textarea {
        height: 10rem;
    }

    footer {
        position: absolute;
        bottom: 1rem;
        left: 50%;
        transform: translateX(-50%);
    }
</style>
