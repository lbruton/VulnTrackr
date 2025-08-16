#!/bin/bash

# Sync project data TO rAgents repository
# Uploads agent protocols, memory, and documentation to centralized hub

echo "🚀 rAgents Sync - Push to Hub"
echo "============================="

# Load project configuration
if [ ! -f ".ragents" ]; then
    echo "❌ .ragents file not found. Run from project root."
    exit 1
fi

PROJECT_NAME=$(grep '"name":' .ragents | cut -d'"' -f4)
RAGENTS_REPO=$(grep '"rAgentsRepo":' .ragents | cut -d'"' -f4)
AGENT_PATH=$(grep '"agentPath":' .ragents | cut -d'"' -f4)
MEMORY_PATH=$(grep '"memoryPath":' .ragents | cut -d'"' -f4)

echo "📁 Project: $PROJECT_NAME"
echo "🔗 rAgents: $RAGENTS_REPO"

# Clone or update rAgents repository
RAGENTS_DIR="../rAgents"
if [ ! -d "$RAGENTS_DIR" ]; then
    echo "📥 Cloning rAgents repository..."
    git clone "$RAGENTS_REPO" "$RAGENTS_DIR"
else
    echo "🔄 Updating rAgents repository..."
    cd "$RAGENTS_DIR"
    git pull origin main
    cd - > /dev/null
fi

# Create timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Sync agent files
echo "📤 Syncing agent protocols..."
mkdir -p "$RAGENTS_DIR/$AGENT_PATH"

# Copy agent files if they exist
for file in agents.ai COPILOT_INSTRUCTIONS.md agents/*.ai; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        cp "$file" "$RAGENTS_DIR/$AGENT_PATH$filename"
        echo "  ✅ $filename"
    fi
done

# Sync memory exports  
echo "📤 Syncing memory exports..."
mkdir -p "$RAGENTS_DIR/$MEMORY_PATH"

if [ -f "memory_export.json" ]; then
    cp "memory_export.json" "$RAGENTS_DIR/${MEMORY_PATH}latest.json"
    cp "memory_export.json" "$RAGENTS_DIR/${MEMORY_PATH}backup_${TIMESTAMP}.json"
    echo "  ✅ Memory exported"
fi

if [ -f "local_memory.json" ]; then
    cp "local_memory.json" "$RAGENTS_DIR/${MEMORY_PATH}local_latest.json"
    echo "  ✅ Local memory exported"
fi

# Sync documentation
echo "📤 Syncing documentation..."
mkdir -p "$RAGENTS_DIR/docs/roadmaps"

if [ -f "docs/roadmap.md" ]; then
    cp "docs/roadmap.md" "$RAGENTS_DIR/docs/roadmaps/${PROJECT_NAME,,}_roadmap.md"
    echo "  ✅ Roadmap synced"
fi

# Update sync timestamp in .ragents file
sed -i '' "s/\"lastSync\": null/\"lastSync\": \"$TIMESTAMP\"/" .ragents
sed -i '' "s/\"lastSync\": \"[^\"]*\"/\"lastSync\": \"$TIMESTAMP\"/" .ragents

# Commit to rAgents repository
echo "📤 Committing to rAgents hub..."
cd "$RAGENTS_DIR"

git add .
git commit -m "Sync $PROJECT_NAME data - $TIMESTAMP

- Updated agent protocols
- Exported memory and documentation  
- Synced roadmap and project files"

git push origin main

echo "✅ Sync to rAgents complete!"
echo "🌐 Repository: $RAGENTS_REPO"

cd - > /dev/null
