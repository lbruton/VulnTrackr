# VulnTrackr v1.0.0

VulnTrackr is a comprehensive client-side web application for tracking vulnerability assessments and security metrics. It's designed to help security teams manage their vulnerability data with detailed VPR scoring, trend analysis, and enhanced tracking capabilities.

## Features

- **Vulnerability Tracking**: Track and analyze security vulnerabilities with VPR scoring
- **CSV Data Processing**: Import vulnerability scan data from CSV files
- **Historical Analysis**: View trends and patterns over time
- **Risk Assessment**: Categorize vulnerabilities by severity (Critical, High, Medium, Low)
- **Interactive Charts**: Visual representation of vulnerability data
- **Export/Import**: Backup and share vulnerability data
- **Docker Support**: Easy deployment for teams

## Quick Start

### Local Development
```bash
cd engine/dev/csvtools
open index.html
```

### Docker Deployment
```bash
cd engine/dev/csvtools
docker-compose up -d
```

## Project Structure

```
VulnTrackr/
├── engine/
│   └── dev/
│       └── csvtools/          # Main vulnerability tracking application
├── docs/                      # Documentation and guides
├── agents/                    # AI agent configurations
├── scripts/                   # Utility scripts
└── tests/                     # Test files
```

## Documentation

- [Engine Documentation](engine/dev/csvtools/README.md) - Detailed application guide
- [Security Guide](docs/security.md) - Security best practices
- [API Documentation](docs/api.md) - Integration guidelines

## License

GNU General Public License v3.0 - see [LICENSE](engine/dev/csvtools/LICENSE) file for details

Copyright © 2025 Lonnie Bruton. This is free and open source software.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally
5. Submit a pull request

---

*VulnTrackr - Professional vulnerability tracking made simple.*
