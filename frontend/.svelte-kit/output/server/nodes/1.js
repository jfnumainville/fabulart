

export const index = 1;
let component_cache;
export const component = async () => component_cache ??= (await import('../entries/fallbacks/error.svelte.js')).default;
export const imports = ["_app/immutable/nodes/1.4dfac617.js","_app/immutable/chunks/index.ab206ff1.js","_app/immutable/chunks/singletons.79086125.js"];
export const stylesheets = [];
export const fonts = [];
