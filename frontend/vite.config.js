import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';
import path from 'path';

export default defineConfig({
  plugins: [sveltekit()],
  server: {
    proxy: {
      '/api': apiEndpoints[env]  // Use the appropriate API endpoint
    },
    port: 3030,
    host: '0.0.0.0'
  },
  resolve:{
    alias:{
      $src: path.resolve(__dirname, 'src'),
      $lib: path.resolve(__dirname, 'src/lib')
    }
  }
});
