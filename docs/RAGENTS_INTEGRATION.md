# rAgents Integration Guide

## Overview
This project is connected to the rAgents centralized hub for AI agent instructions and memory sharing.

## Available Resources

### Agent Protocols
- `agents/shared/` - Project-specific and universal agent protocols
- Instructions and initialization procedures from rAgents hub

### Shared Memory  
- `memory/shared/` - Memory exports from all projects in ecosystem
- Cross-project context and development history

### Documentation
- `docs/shared/` - Centralized documentation and roadmaps
- Project roadmaps and development protocols

## Usage for AI Agents

### Primary Instructions
1. Read `.ragents` configuration in project root
2. Access agent protocols in `agents/shared/`
3. Use shared memory for cross-project context
4. Follow universal onboarding procedures

### When MCP Memory Unavailable
- Use `memory/shared/{project}/latest.json` for project context
- Read `docs/shared/roadmaps/{project}_roadmap.md` for current status
- Access agent protocols in `agents/shared/`

### Sync Commands
```bash
# Push local changes to rAgents hub
./scripts/sync_to_ragents.sh

# Pull latest from rAgents hub
./scripts/sync_from_ragents.sh
```

## Repository
Private rAgents hub: https://github.com/lbruton/rAgents.git
