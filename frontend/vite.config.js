import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';
import path from 'path';

// Define API endpoints for different environments
const apiEndpoints = {
  development: 'http://127.0.0.1:3000',
  //production: 'https://your-production-api.com'
};

// Get current environment (defaults to 'development')
const env = process.env.NODE_ENV || 'development';

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
