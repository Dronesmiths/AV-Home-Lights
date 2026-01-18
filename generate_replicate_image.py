import os
import requests
import json
import time

# Check for API token
api_token = os.environ.get('REPLICATE_API_TOKEN')
if not api_token:
    print("ERROR: REPLICATE_API_TOKEN not found in environment")
    exit(1)

# Replicate API endpoint
url = "https://api.replicate.com/v1/predictions"

headers = {
    "Authorization": f"Token {api_token}",
    "Content-Type": "application/json"
}

# Request payload
payload = {
    "version": "black-forest-labs/flux-schnell",
    "input": {
        "prompt": "Professional photograph of a bearded man in his 30s with a gray beanie, wearing a black polo shirt with 'AV Home Lighting' logo, standing on a ladder installing LED strip lights on the exterior roofline of a modern High Desert home. He's focused on his work, installing warm white LED lights along the eaves. Photo taken from a low angle showing professional installation work in progress. Daytime, California desert home exterior, professional electrician at work. Realistic, high-quality photography.",
        "num_outputs": 1
    }
}

# Make request
response = requests.post(url, headers=headers, json=payload)
print(f"Status: {response.status_code}")
print(f"Response: {response.text}")
