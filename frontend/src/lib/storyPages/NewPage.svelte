<script>
    import Button from '../buttons/Button.svelte';

    let imgDescription = '';
    let pageText = '';

    function createPage() {
        // Here is where you can use the fetch API or something else to communicate with backend and send data
        console.log({
            imgDescription: imgDescription,
            pageText: pageText
        })

        // Clear fields after submit
        imgDescription = '';
        pageText = '';
    }
</script>

<div class="container">
    <div class="new-story-card">
        <img src="/page-template.png" alt="#">
        <div class="page-text-wrapper">
            <form>
                <div class="form-group">
                    <label for="img-description">Image description</label>
                    <textarea bind:value={imgDescription} name="img-description" id="img-description" placeholder="Describe the image you would like to see on the page."></textarea>
                </div>
                <div class="form-group">
                    <label for="page-text">Page text</label>
                    <textarea bind:value={pageText} name="page-text" id="page-text" placeholder="Enter the text that will appear on the page."></textarea>
                </div>
            </form>
            <footer>
                <Button on:click={createPage} bgColor="bg-peach">Create</Button>
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
        flex-basis: 45%;
        min-width: 45%;
        min-width: 300px;
        border-radius: 0 0.5rem 0.5rem 0;
    }
    
    .form-group {
        width: 100%;
        margin-bottom: 1.5rem;
    }

    label {
        font-weight: bold;
        font-size: 0.9rem;
    }

    .form-group textarea {
        height: 10rem;
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

    footer {
        position: absolute;
        bottom: 1rem;
        left: 50%;
        transform: translateX(-50%);
    }
</style>