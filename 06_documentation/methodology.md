# Analysis Methodology

## Objective

Analyse selected NHS outpatient attendance activity and compare provider-level did-not-attend (DNA) rates.

## Selected Measures

The analysis uses four attendance measures:

1. `01.Attended first appointment`
2. `03.Attended subsequent appointment`
3. `06.Did not attend first appointment`
4. `08.Did not attend subsequent appointment`

## Calculations

Attended appointments = Attended first + Attended subsequent

DNA appointments = DNA first + DNA subsequent

Selected appointment volume = Attended appointments + DNA appointments

Selected DNA rate = DNA appointments / Selected appointment volume

## Provider Inclusion Criteria

Providers qualified when they had:

- One unique, valid numeric record for each selected measure
- No suppressed values within the four selected measures
- At least 1,000 selected appointments

The minimum-volume threshold was chosen to reduce the influence of providers with small appointment counts.

## Analysis Process

### Excel

Explored the source dataset, checked measure availability, calculated initial provider metrics and developed pivot tables.

### SQL

Imported the dataset into SQLite, filtered the selected measures, aggregated provider-level activity and created a view containing qualifying providers.

### Power BI

Imported the SQL analysis output and developed interactive visuals using DAX measures.

## Weighted DNA Rate

The overall selected DNA rate was calculated as:

Total DNA appointments / Total selected appointments

This weights providers according to their appointment volumes rather than treating every provider equally.

## Scope

The results describe selected outpatient attendance measures for qualifying providers during 2025/26.

They should not be interpreted as a complete national outpatient DNA rate or as evidence of provider performance without considering differences in services and patient populations.