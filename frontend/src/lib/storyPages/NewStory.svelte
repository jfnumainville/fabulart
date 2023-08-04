<script>
    import Button from '../Button.svelte';
</script>

<div class="new-story-card">
    <img src="/story-template.png" alt="#">
    <div class="page-text-wrapper">
        <form on:submit|preventDefault={createStory}>
            <div class="form-group">
                <label for="">Story Title</label>
                <input type="text" placeholder="Enter your story title here">
            </div>
            <div class="form-group">
                <label for="">Cover image</label>
                <textarea name="" id="" placeholder="Describe the image you would like to see"></textarea>
            </div>
        </form>
        <footer>
            <Button type="submit" bgColor="bg-yellow">Create</Button>
        </footer>
    </div>
</div>

<style>
     .new-story-card {
        position: relative;
        width: 60%;
        min-width: 600px;
        height: 600px;
        margin: 5rem auto;
        box-shadow: 0 4px 8px #00000020;
        border-radius: 0.5rem;

        display: flex;
        align-items: center;
        justify-content: center;
    }

    img {
        height: 100%;
        flex-basis: 60%;
        min-width: 60%;
        border-radius: 0.5rem 0 0 0.5rem;
        object-fit: cover;
        object-position: center;
    }


    .page-text-wrapper {
        position: relative;
        background-color: #f5f5f5;
        padding: 2rem;
        height: 100%;
        flex-basis: 40%;
        min-width: 40%;
        min-width: 300px;
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
    }

    textarea {
        height: 10rem;
    }

    button {
        position: absolute;
        bottom: 1rem;
        left: 50%;
        transform: translateX(-50%);
    }
</style>