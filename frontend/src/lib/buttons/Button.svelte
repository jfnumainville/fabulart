<script>
    export let bgColor = 'bg-none';
    export let shape = 'square'
    export let url = null;
    import { t } from 'svelte-i18n';
    $: classes = `${bgColor} ${shape}`
</script>

<a on:click href="{url}" class="btn no-border {classes}">
    <slot>{$t('button.text')}</slot>
</a>

<style lang="scss">
    .btn,
    .btn:link,
    .btn:visited {
        border: none;
        border: none;
        display: inline-block;
        text-decoration: none;
        text-align: center;
        width: 100%;
        padding: 0.8rem;
        color: #fff;
        box-shadow: 0 4px 8px #0000002f;

        &:hover,
        &:active {
            cursor: pointer;
        }
    }

    /* Button shape */
    .round {
        border-radius: 100px;
    }

    .square {
        border-radius: 0.25rem;
    }

    /* Background colors */
    .bg-none {
        background-color: transparent;
    }

    .bg-peach {
        background-color: var(--pink);

        &:hover {
            background-color: var(--pink-hover);
        }

        &:active {
            background-color: var(--pink-active);
        }
    }

    .bg-yellow {
        background-color: var(--yelow);
        text-shadow: 0 2px 8px #00000021;
    }

    .bg-blue {
        background-color: #339af0;
    }

    .bg-red {
        background-color: #fa5252;
    }

    .bg-green {
        background-color: #51cf66;
    }
</style>
