<script>
    import Button from '../buttons/Button.svelte';

    let storyTitle = '';
    let imgDescription = '';

    function createStory() {
        // Here is where you can use the fetch API or something else to communicate with backend and send data
        console.log({
            storyTitle: storyTitle,
            imgDescription: imgDescription
        })

        // Clear fields after submit
        storyTitle = '';
        imgDescription = '';
    }

</script>

<div class="container">
    <div class="new-story-card">
        <img src="/story-template.png" alt="#">
        <div class="page-text-wrapper">
            <form>
                <div class="form-group">
                    <label for="story-title">Story Title</label>
                    <input bind:value={storyTitle} id="story-title" name="story-title" type="text" placeholder="Enter your story title here.">
                </div>
                <div class="form-group">
                    <label for="img-description">Cover picture</label>
                    <textarea bind:value={imgDescription} name="img-description" id="img-description" placeholder="Describe what picture you would like for your story cover."></textarea>
                </div>
            </form>
            <footer>
                <Button on:click={createStory} bgColor="bg-peach">Create</Button>
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