const fs = require('fs');
const path = require('path');
const https = require('https');

// Configuration - UPDATE THESE
const SUPABASE_URL = 'https://bsnvsraqmdzidfihgwvn.supabase.co';
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJzbnZzcmFxbWR6aWRmaWhnd3ZuIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3MDM0NjI5NywiZXhwIjoyMDg1OTIyMjk3fQ.KqZ8virbkxYR5O2br2Js5Iw-WqdtPJQEKIDWSeFuYhw';
const BUCKET_NAME = 'portfolio';

const BUILD_DIR = './build/web';

// Get content type
function getContentType(filepath) {
  const ext = path.extname(filepath).toLowerCase();
  const types = {
    '.html': 'text/html',
    '.css': 'text/css',
    '.js': 'application/javascript',
    '.json': 'application/json',
    '.png': 'image/png',
    '.jpg': 'image/jpeg',
    '.jpeg': 'image/jpeg',
    '.svg': 'image/svg+xml',
    '.woff': 'font/woff',
    '.woff2': 'font/woff2',
    '.ttf': 'font/ttf',
  };
  return types[ext] || 'application/octet-stream';
}

// Upload file
function uploadFile(filepath, content) {
  return new Promise((resolve, reject) => {
    const url = new URL(`${SUPABASE_URL}/storage/v1/object/${BUCKET_NAME}/${filepath}`);
    
    const options = {
      method: 'POST',
      hostname: url.hostname,
      path: url.pathname,
      headers: {
        'Authorization': `Bearer ${SUPABASE_KEY}`,
        'Content-Type': getContentType(filepath),
        'Content-Length': content.length,
        'Cache-Control': 'public, max-age=31536000',
      },
    };

    const req = https.request(options, (res) => {
      if (res.statusCode === 200 || res.statusCode === 201) {
        console.log(` Uploaded: ${filepath}`);
        resolve();
      } else {
        console.log(`Failed: ${filepath} (${res.statusCode})`);
        reject(new Error(`Upload failed: ${res.statusCode}`));
      }
    });

    req.on('error', reject);
    req.write(content);
    req.end();
  });
}

// Get all files recursively
function getAllFiles(dir, fileList = []) {
  const files = fs.readdirSync(dir);
  
  files.forEach(file => {
    const filepath = path.join(dir, file);
    if (fs.statSync(filepath).isDirectory()) {
      getAllFiles(filepath, fileList);
    } else {
      fileList.push(filepath);
    }
  });
  
  return fileList;
}

// Main deployment
async function deploy() {
  console.log('🚀 Starting deployment to Supabase Storage...\n');
  
  if (!fs.existsSync(BUILD_DIR)) {
    console.error('❌ Build directory not found!');
    console.log('Run: flutter build web --release');
    process.exit(1);
  }

  const files = getAllFiles(BUILD_DIR);
  console.log(`📦 Found ${files.length} files to upload\n`);

  for (const file of files) {
    const relativePath = path.relative(BUILD_DIR, file).replace(/\\/g, '/');
    const content = fs.readFileSync(file);
    
    try {
      await uploadFile(relativePath, content);
    } catch (error) {
      console.error(`Error uploading ${relativePath}:`, error.message);
    }
  }

  console.log('\n✅ Deployment complete!\n');
  console.log('🌐 Your portfolio is live at:');
  console.log(`${SUPABASE_URL}/storage/v1/object/public/${BUCKET_NAME}/index.html\n`);
}

deploy().catch(console.error);
