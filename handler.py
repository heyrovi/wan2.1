import os
import uuid
import subprocess

def handler(event):
    prompt = event["input"].get("prompt", "a robot dancing in space")
    output_dir = f"/tmp/{uuid.uuid4()}"
    os.makedirs(output_dir, exist_ok=True)

    os.chdir("/app/wan21")

    cmd = [
        "python", "scripts/inference.py",
        "--prompt", prompt,
        "--output_dir", output_dir,
        "--num_frames", "24",
        "--resolution", "512"
    ]

    subprocess.run(cmd, check=True)

    return {
        "status": "done",
        "video_path": f"{output_dir}/result.mp4"
    }
