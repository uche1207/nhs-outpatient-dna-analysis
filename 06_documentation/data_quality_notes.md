# Data Quality Notes

## Source Dataset

- Reporting period: 2025/26
- Source records: 55,845
- Distinct provider codes: 1,819

## Data Quality Checks

The analysis checked for:

- Missing selected attendance measures
- Suppressed values represented by `*`
- Non-numeric measure values
- Duplicate records for selected measures
- Providers below the minimum selected appointment volume

Suppressed values were not converted to zero.

## Provider Inclusion

469 providers satisfied the SQL inclusion criteria.

These providers had four valid selected attendance measures and at least 1,000 selected appointments.

## Validation

The following results were independently checked between Excel and SQLite:

- 469 qualifying providers
- Top 10 provider rankings
- Top 10 selected DNA rates

Higher Blackley Medical Centre recorded 280 DNAs from 1,595 selected appointments, producing a selected DNA rate of approximately 17.55%.

## Outstanding Limitation

An inconsistency remains in the Excel data-quality audit classifications affecting 144 excluded providers.

The discrepancy does not invalidate the independently checked qualifying-provider count or Top 10 results, but a complete reconciliation of excluded-provider classifications has not been completed.

## Interpretation

The results cover only the selected measures and qualifying providers.

The analysis does not explain why patients missed appointments. Differences in clinical services, provider types and patient populations should be considered before making performance judgements.