import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react-swc'

// https://vitejs.dev/config/
export default defineConfig({
  server: {
    // We have to listen on 0.0.0.0 (all addresses) in order to let docker discover this service:
    host: '0.0.0.0'
  },
  plugins: [react()],
})
