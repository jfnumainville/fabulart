<script>
  import Button from '../buttons/Button.svelte';
  import { t } from 'svelte-i18n';

  const apiEndpoint = process.env.API_ENDPOINT;
  const timeoutDuration = 45000;

  let storyTitle = '';
  let imgDescription = '';
  let imageUrl = null;
  const userId = 2; // Placeholder for user ID
  let storyId = null;
  let isLoading = false;
  let showAlertBox = false;
  let alertMessage = '';
  let remainingPrompts = 0;

  async function createStory() {
      let url = "";
      let methodType = "";
      isLoading = true;

      //Stopping the process of creating a story if either the title or the image description is missing, an alert will be displayed.
      if (storyTitle.trim() === '' || imgDescription.trim() === '') {
        showAlert('alerts.missingFields');
        isLoading = false;
        return;
      }

      const controller = new AbortController();
      const signal = controller.signal;

      // Setting up the timeout
      const timeoutId = setTimeout(() => {
          console.log("API call is aborted.");
          controller.abort();
          isLoading = false;
          showAlert('alerts.apiError');
      }, timeoutDuration);

      if (storyId){
          url = `${apiEndpoint}/users/${userId}/stories/${storyId}`;
          methodType = 'PUT';
      } else {
          url = `${apiEndpoint}/users/${userId}/stories`;
          methodType = 'POST';
      }

      const payload = {
          title: storyTitle,
          style: "Neo",
          image_prompt: imgDescription,
      };

      try {
          const response = await fetch(url, {
              method: methodType,
              headers: {
                  'Content-Type': 'application/json'
              },
              body: JSON.stringify(payload),
              signal
          });

          clearTimeout(timeoutId); // Clear the timeout on receiving response
          isLoading = false;

          if (response.status === 201 || response.status === 200) {
              const data = await response.json();
              imageUrl = data.story.image_url;
              storyId = data.story.id;
              remainingPrompts = data.remaining_prompts;
              //Closing any old alerts that the user left opened upon successful completion
              dismissAlert();

              if (remainingPrompts <= 5){
                showAlert('alerts.fewAttemptsLeft')
              }


          }else if (response.status === 403){
            showAlert('alerts.zeroAttempts')
          }else {
              showAlert('alerts.apiError');
          }
      } catch (error) {
          console.error("Error during fetch:", error);
          clearTimeout(timeoutId);
          isLoading = false;
          showAlert('alerts.apiError'); // Show a different alert for fetch errors
      }
  }


  async function regenerateStoryImage() {
    if (!storyId) return; // Do nothing if storyId is not set

    const regenerateUrl = `${apiEndpoint}/users/${userId}/stories/${storyId}/regenerate`;
    isLoading = true;

    try {
      const response = await fetch(regenerateUrl, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' }
      });

      isLoading = false;

      if (response.status === 201 || response.status === 200) {
        const data = await response.json();
        imageUrl = data.story.image_url; // Assuming this is the key in your response

      if (remainingPrompts <= 5){
            showAlert('alerts.fewAttemptsLeft')
           }

          }else if (response.status === 403){
            showAlert('alerts.zeroAttempts')
          }else {
              showAlert('alerts.apiError');
          }
    } catch (error) {
      console.error("Error during fetch:", error);
      isLoading = false;
      showAlert('alerts.apiError');
    }
  }

  function showAlert(message) {
      alertMessage = message;
      showAlertBox = true;
  }

  function dismissAlert() {
      showAlertBox = false;
  }
</script>

   <div class="container">
    <div class="alert alert-warning alert-dismissible fade show" role="alert" style={showAlertBox ? 'display: block;' : 'display: none;'}>
      {$t(alertMessage)}
      <button type="button" class="btn-close" aria-label="Close" on:click={dismissAlert}></button>
    </div>
        <div class="new-story-card">
            <img src={imageUrl ? imageUrl : '/story-template.png'} alt={imgDescription? imgDescription : "Placeholder story image"}>
            <div class="page-text-wrapper">
                <form>
                    <div class="form-group">
                        <label for="story-title">{$t('NewStory.story_title')}</label>
                        <input bind:value={storyTitle} id="story-title" name="story-title" type="text" placeholder={$t('NewStory.story_placeholder')} disabled={isLoading}>
                    </div>
                    <div class="form-group">
                        <label for="img-description">{$t('NewStory.cover_picture')}</label>
                        <textarea bind:value={imgDescription} name="img-description" id="img-description" placeholder={$t('NewStory.picture_placeholder')} disabled={isLoading}></textarea>
                    </div>
                </form>
                {#if storyId && !isLoading}
                        <button class="btn btn-primary" on:click={regenerateStoryImage} aria-label="Regenerate Image">
                          <i class="bi bi-arrow-repeat" style="font-size: 1.2em"></i>
                        </button>
                {/if}
                <footer>
                  {#if isLoading}
                    <div class="spinner-border text-warning" role="status"></div>
                  {:else}
                    {#if storyId}
                      <Button on:click={createStory} bgColor="bg-peach">{$t('NewStory.update_button')}</Button>
                    {:else}
                      <Button on:click={createStory} bgColor="bg-peach">{$t('NewStory.create_button')}</Button>
                    {/if}
                  {/if}
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
