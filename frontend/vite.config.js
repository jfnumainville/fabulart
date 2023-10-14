import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';
import path from 'path';

// Determine if we're running in development mode
const isDev = process.env.NODE_ENV === 'development';

// TODO: Need to update with prod API endpont.
const apiEndpoint = isDev ? 'http://127.0.0.1:3000' : 'PROD_ENDPOINT_TBD';

export default defineConfig({
  plugins: [sveltekit()],
  resolve: {
    alias: {
      $src: path.resolve(__dirname, 'src'),
      $lib: path.resolve(__dirname, 'src/lib')
    }
  },
  server: {
    port: isDev ? 3030 : 8080,
    host: isDev ? '0.0.0.0' : 'localhost'
  },
  define: {
    'process.env.API_ENDPOINT': JSON.stringify(apiEndpoint),
  }
});
