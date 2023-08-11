

export const index = 2;
let component_cache;
export const component = async () => component_cache ??= (await import('../entries/pages/_page.svelte.js')).default;
export const imports = ["_app/immutable/nodes/2.6c76319e.js","_app/immutable/chunks/index.ab206ff1.js"];
export const stylesheets = ["_app/immutable/assets/2.b9be175d.css"];
export const fonts = [];
