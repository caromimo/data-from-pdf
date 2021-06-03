# EXTRACT AND COLLATE DATA FROM PDFs

# Extract the data from pdfs with camelot

.PHONY: extract-broughton-archipelago-2016-2020
extract-broughton-archipelago-2016-2020:
		camelot -p 45-71 -f csv --output ./data/interim/broughton_archipelago/broughton_archipelago_2016.csv lattice ./data/raw/broughton_archipelago/broughton-wild-juvenile-salmonid-monitoring-2016.pdf
		camelot -p 47-73 -f csv --output ./data/interim/broughton_archipelago/broughton_archipelago_2017.csv lattice ./data/raw/broughton_archipelago/broughton-wild-juvenile-salmonid-monitoring-2017.pdf
		camelot -p 47-62 -f csv --output ./data/interim/broughton_archipelago/broughton_archipelago_2018.csv lattice ./data/raw/broughton_archipelago/broughton-wild-juvenile-salmonid-monitoring-2018.pdf
		camelot -p 51-61 -f csv --output ./data/interim/broughton_archipelago/broughton_archipelago_2019.csv lattice ./data/raw/broughton_archipelago/broughton-wild-juvenile-salmonid-monitoring-2019.pdf
		camelot -p 44-63 -f csv --output ./data/interim/broughton_archipelago/broughton_archipelago_2020.csv lattice ./data/raw/broughton_archipelago/Broughton-Wild-Juvenile-Salmonid-Monitoring-2020.pdf

.PHONY: extract-discovery-islands-2017-2020
extract-discovery-islands-2017-2020:
		camelot -p 74-106 -f csv --output ./data/interim/discovery_islands/discovery_islands_2017.csv lattice ./data/raw/discovery_islands/discovery-islands-juvenile-salmonid-monitoring-2017.pdf
		camelot -p 80-109 -f csv --output ./data/interim/discovery_islands/discovery_islands_2018.csv lattice ./data/raw/discovery_islands/discovery-islands-juvenile-salmonid-monitoring-2018.pdf
		camelot -p 68-95 -f csv --output ./data/interim/discovery_islands/discovery_islands_2019.csv lattice ./data/raw/discovery_islands/discovery-islands-juvenile-salmonid-monitoring-2019.pdf
		camelot -p 62-87 -f csv --output ./data/interim/discovery_islands/discovery_islands_2020.csv lattice ./data/raw/discovery_islands/Discovery-Islands-Juvenile-Salmonid-Monitoring-2020-V2.pdf

.PHONY: extract-quatsino-2016-2020
extract-quatsino-2016-2020:
		camelot -p 35-41 -f csv --output ./data/interim/quatsino/quatsino_2016.csv lattice ./data/raw/quatsino/quatsino-wild-juvenile-salmonid-monitoring-2016.pdf
		camelot -p 36-46 -f csv --output ./data/interim/quatsino/quatsino_2017.csv lattice ./data/raw/quatsino/quatsino-wild-juvenile-salmonid-monitoring-2017.pdf
		camelot -p 39-48 -f csv --output ./data/interim/quatsino/quatsino_2018.csv lattice ./data/raw/quatsino/quatsino-wild-juvenile-salmonid-monitoring-2018.pdf
		camelot -p 38-49 -f csv --output ./data/interim/quatsino/quatsino_2019.csv lattice ./data/raw/quatsino/quatsino-wild-juvenile-salmonid-monitoring-2019.pdf
		camelot -p 35-44 -f csv --output ./data/interim/quatsino/quatsino_2020.csv lattice ./data/raw/quatsino/Quatsino-Wild-Juvenile-Salmonid-Monitoring-2020.pdf

# Append the csv files with csvkit

# if needed, install csvkit: 
# pip install csvkit

.PHONY: collate-broughton-archipelago-per-year
collate-broughton-archipelago-per-year:
		csvstack data/interim/broughton_archipelago/broughton_archipelago_2016* > data/interim/broughton_archipelago/all_broughton_archipelago_2016.csv
		csvstack data/interim/broughton_archipelago/broughton_archipelago_2017* > data/interim/broughton_archipelago/all_broughton_archipelago_2017.csv
		csvstack data/interim/broughton_archipelago/broughton_archipelago_2018* > data/interim/broughton_archipelago/all_broughton_archipelago_2018.csv
		csvstack data/interim/broughton_archipelago/broughton_archipelago_2019* > data/interim/broughton_archipelago/all_broughton_archipelago_2019.csv
		csvstack data/interim/broughton_archipelago/broughton_archipelago_2020* > data/interim/broughton_archipelago/all_broughton_archipelago_2020.csv

.PHONY: collate-discovery-islands-per-year
collate-discovery-islands-per-year:
		csvstack data/interim/discovery_islands/discovery_islands_2017* > data/interim/discovery_islands/all_discovery_islands_2017.csv
		csvstack data/interim/discovery_islands/discovery_islands_2018* > data/interim/discovery_islands/all_discovery_islands_2018.csv
		csvstack data/interim/discovery_islands/discovery_islands_2019* > data/interim/discovery_islands/all_discovery_islands_2019.csv
		csvstack data/interim/discovery_islands/discovery_islands_2020* > data/interim/discovery_islands/all_discovery_islands_2020.csv

.PHONY: collate-quatsino-per-year
collate-quatsino-per-year:
		csvstack data/interim/quatsino/quatsino_2016* > data/interim/quatsino/all_quatsino_2016.csv
		csvstack data/interim/quatsino/quatsino_2017* > data/interim/quatsino/all_quatsino_2017.csv
		csvstack data/interim/quatsino/quatsino_2018* > data/interim/quatsino/all_quatsino_2018.csv
		csvstack data/interim/quatsino/quatsino_2019* > data/interim/quatsino/all_quatsino_2019.csv
		csvstack data/interim/quatsino/quatsino_2020* > data/interim/quatsino/all_quatsino_2020.csv

# Extract and collate all in one step:

.PHONY: all
all: extract collate

.PHONY: extract
extract: extract-broughton-archipelago-2016-2020 extract-discovery-islands-2017-2020 extract-quatsino-2016-2020

.PHONY: collate
collate: collate-broughton-archipelago-per-year collate-discovery-islands-per-year collate-quatsino-per-year

# Clean directories when needed

.PHONY: clean
clean:
		rm -f data/interim/broughton_archipelago/*
		rm -f data/interim/discovery_islands/*
		rm -f data/interim/quatsino/*
