import { c as create_ssr_component, v as validate_component, m as missing_component } from "../../chunks/index.js";
const __layout_svelte_svelte_type_style_lang = "";
const css = {
  code: "@import './global.scss';",
  map: null
};
const _layout = create_ssr_component(($$result, $$props, $$bindings, slots) => {
  $$result.css.add(css);
  return `${$$result.head += `<!-- HEAD_svelte-1r58gxo_START -->${$$result.title = `<title>Fabulart Layout</title>`, ""}<!-- HEAD_svelte-1r58gxo_END -->`, ""}


${slots.default ? slots.default({}) : ``}`;
});
const Navbar_svelte_svelte_type_style_lang = "";
const Page = create_ssr_component(($$result, $$props, $$bindings, slots) => {
  return `${$$result.head += `<!-- HEAD_svelte-162ipmn_START -->${$$result.title = `<title>Fabulart | Create your own story with AI generated images</title>`, ""}<!-- HEAD_svelte-162ipmn_END -->`, ""}



${validate_component(_layout || missing_component, "svelte:component").$$render($$result, {}, {}, {
    default: () => {
      return `<h1>Hello World</h1>`;
    }
  })}`;
});
export {
  Page as default
};
