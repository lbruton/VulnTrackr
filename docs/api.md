# API Documentation

## Overview
VulnTrackr provides client-side APIs for vulnerability data processing and integration.

## Data Format
CSV files should contain:
- VPR score column (vpr, vpr_score, score)
- Severity column (severity, risk, priority, level)
- Optional date columns for trend analysis

## Integration Examples
```javascript
// Initialize VulnTrackr
const vulnTracker = new VulnTracker();

// Process CSV data
vulnTracker.processCSV(csvData, options);

// Get current metrics
const metrics = vulnTracker.getCurrentMetrics();
```

## Export/Import
- JSON format for data exchange
- Encrypted export options available
- Backup and restore functionality
