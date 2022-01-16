# EXTRACT AND COLLATE DATA FROM PDFs

# Extract the data from pdfs with camelot

.PHONY: extract-broughton-archipelago-data
extract-broughton-archipelago-data:
		camelot -p 45-71 -f csv --output ./data/interim/broughton_archipelago/broughton_archipelago_2016.csv lattice ./data/raw/broughton_archipelago/broughton-wild-juvenile-salmonid-monitoring-2016.pdf
		camelot -p 47-73 -f csv --output ./data/interim/broughton_archipelago/broughton_archipelago_2017.csv lattice ./data/raw/broughton_archipelago/broughton-wild-juvenile-salmonid-monitoring-2017.pdf
		camelot -p 47-62 -f csv --output ./data/interim/broughton_archipelago/broughton_archipelago_2018.csv lattice ./data/raw/broughton_archipelago/broughton-wild-juvenile-salmonid-monitoring-2018.pdf
		camelot -p 51-61 -f csv --output ./data/interim/broughton_archipelago/broughton_archipelago_2019.csv lattice ./data/raw/broughton_archipelago/broughton-wild-juvenile-salmonid-monitoring-2019.pdf
		camelot -p 44-63 -f csv --output ./data/interim/broughton_archipelago/broughton_archipelago_2020.csv lattice ./data/raw/broughton_archipelago/Broughton-Wild-Juvenile-Salmonid-Monitoring-2020.pdf
		camelot -p 39-50 -f csv --output ./data/interim/broughton_archipelago/broughton_archipelago_2021.csv lattice ./data/raw/broughton_archipelago/Broughton-Wild-Juvenile-Salmonid-Monitoring-2021-V2.pdf

.PHONY: extract-broughton-archipelago-sites
extract-broughton-archipelago-sites:
		camelot -p 13 -f csv --output ./data/interim/broughton_archipelago/broughton_archipelago_locations_2016.csv stream ./data/raw/broughton_archipelago/broughton-wild-juvenile-salmonid-monitoring-2016.pdf
		camelot -p 13 -f csv --output ./data/interim/broughton_archipelago/broughton_archipelago_locations_2017.csv stream ./data/raw/broughton_archipelago/broughton-wild-juvenile-salmonid-monitoring-2017.pdf
		camelot -p 13 -f csv --output ./data/interim/broughton_archipelago/broughton_archipelago_locations_2018.csv stream ./data/raw/broughton_archipelago/broughton-wild-juvenile-salmonid-monitoring-2018.pdf
		camelot -p 13-14 -f csv --output ./data/interim/broughton_archipelago/broughton_archipelago_locations_2019.csv stream ./data/raw/broughton_archipelago/broughton-wild-juvenile-salmonid-monitoring-2019.pdf
		camelot -p 12 -f csv --output ./data/interim/broughton_archipelago/broughton_archipelago_locations_2020.csv stream ./data/raw/broughton_archipelago/Broughton-Wild-Juvenile-Salmonid-Monitoring-2020.pdf
		camelot -p 11 -f csv --output ./data/interim/broughton_archipelago/broughton_archipelago_locations_2021.csv stream ./data/raw/broughton_archipelago/Broughton-Wild-Juvenile-Salmonid-Monitoring-2021-V2.pdf

.PHONY: extract-discovery-islands-data
extract-discovery-islands-data:
		camelot -p 74-106 -f csv --output ./data/interim/discovery_islands/discovery_islands_2017.csv lattice ./data/raw/discovery_islands/discovery-islands-juvenile-salmonid-monitoring-2017.pdf
		camelot -p 80-109 -f csv --output ./data/interim/discovery_islands/discovery_islands_2018.csv lattice ./data/raw/discovery_islands/discovery-islands-juvenile-salmonid-monitoring-2018.pdf
		camelot -p 68-95 -f csv --output ./data/interim/discovery_islands/discovery_islands_2019.csv lattice ./data/raw/discovery_islands/discovery-islands-juvenile-salmonid-monitoring-2019.pdf
		camelot -p 62-87 -f csv --output ./data/interim/discovery_islands/discovery_islands_2020.csv lattice ./data/raw/discovery_islands/Discovery-Islands-Juvenile-Salmonid-Monitoring-2020-V2.pdf
		camelot -p 63-98 -f csv --output ./data/interim/discovery_islands/discovery_islands_2021.csv lattice ./data/raw/discovery_islands/Discovery-Islands-Juvenile-Salmonid-Monitoring-2021-V3.pdf

.PHONY: extract-quatsino-data
extract-quatsino-data:
		camelot -p 35-41 -f csv --output ./data/interim/quatsino/quatsino_2016.csv lattice ./data/raw/quatsino/quatsino-wild-juvenile-salmonid-monitoring-2016.pdf
		camelot -p 36-46 -f csv --output ./data/interim/quatsino/quatsino_2017.csv lattice ./data/raw/quatsino/quatsino-wild-juvenile-salmonid-monitoring-2017.pdf
		camelot -p 39-48 -f csv --output ./data/interim/quatsino/quatsino_2018.csv lattice ./data/raw/quatsino/quatsino-wild-juvenile-salmonid-monitoring-2018.pdf
		camelot -p 38-49 -f csv --output ./data/interim/quatsino/quatsino_2019.csv lattice ./data/raw/quatsino/quatsino-wild-juvenile-salmonid-monitoring-2019.pdf
		camelot -p 35-44 -f csv --output ./data/interim/quatsino/quatsino_2020.csv lattice ./data/raw/quatsino/Quatsino-Wild-Juvenile-Salmonid-Monitoring-2020.pdf
		camelot -p 35-46 -f csv --output ./data/interim/quatsino/quatsino_2021.csv lattice ./data/raw/quatsino/Quatsino-Wild-Juvenile-Salmonid-Monitoring-2021.pdf

.PHONY: extract-clayoquot-data
extract-clayoquot-data:
		camelot -p 32-49 -f csv --output ./data/interim/clayoquot/extracted/clayoquot_2016.csv stream ./data/interim/clayoquot/Clayoquot-Wild-Juvenile-Salmonid-Monitoring-2016.pdf
		camelot -p 45-69 -f csv --output ./data/interim/clayoquot/extracted/clayoquot_2017.csv stream ./data/interim/clayoquot/Clayoquot-Wild-Juvenile-Salmonid-Monitoring-2017.pdf
		camelot -p 44-61 -f csv --output ./data/interim/clayoquot/extracted/clayoquot_2018.csv stream ./data/interim/clayoquot/Clayoquot-Wild-Juvenile-Salmonid-Monitoring-2018.pdf
		camelot -p 40-50 -f csv --output ./data/interim/clayoquot/extracted/clayoquot_2019.csv stream ./data/interim/clayoquot/Clayoquot-Wild-Juvenile-Salmonid-Monitoring-2019.pdf
		camelot -p 39-53 -f csv --output ./data/interim/clayoquot/extracted/clayoquot_2020.csv stream ./data/interim/clayoquot/Clayoquot-Wild-Juvenile-Salmonid-Monitoring-2020.pdf
		camelot -p 37-58 -f csv --output ./data/interim/clayoquot/extracted/clayoquot_2021.csv stream ./data/interim/clayoquot/Clayoquot-Wild-Juvenile-Salmonid-Monitoring-2021.pdf

# Append the csv files with csvkit

# if needed, install csvkit: 
# pip install csvkit

.PHONY: collate-broughton-archipelago-data
collate-broughton-archipelago-data:
		csvstack data/interim/broughton_archipelago/broughton_archipelago_2016* > data/interim/broughton_archipelago/all_broughton_archipelago_2016.csv
		csvstack data/interim/broughton_archipelago/broughton_archipelago_2017* > data/interim/broughton_archipelago/all_broughton_archipelago_2017.csv
		csvstack data/interim/broughton_archipelago/broughton_archipelago_2018* > data/interim/broughton_archipelago/all_broughton_archipelago_2018.csv
		csvstack data/interim/broughton_archipelago/broughton_archipelago_2019* > data/interim/broughton_archipelago/all_broughton_archipelago_2019.csv
		csvstack data/interim/broughton_archipelago/broughton_archipelago_2020* > data/interim/broughton_archipelago/all_broughton_archipelago_2020.csv
		csvstack data/interim/broughton_archipelago/broughton_archipelago_2021* > data/interim/broughton_archipelago/all_broughton_archipelago_2021.csv

.PHONY: collate-broughton-archipelago-sites
collate-broughton-archipelago-sites:
		csvstack data/interim/broughton_archipelago/broughton_archipelago_locations_2016* > data/interim/broughton_archipelago/all_broughton_archipelago_locations_2016.csv
		csvstack data/interim/broughton_archipelago/broughton_archipelago_locations_2017* > data/interim/broughton_archipelago/all_broughton_archipelago_locations_2017.csv
		csvstack data/interim/broughton_archipelago/broughton_archipelago_locations_2018* > data/interim/broughton_archipelago/all_broughton_archipelago_locations_2018.csv
		csvstack data/interim/broughton_archipelago/broughton_archipelago_locations_2019* > data/interim/broughton_archipelago/all_broughton_archipelago_locations_2019.csv
		csvstack data/interim/broughton_archipelago/broughton_archipelago_locations_2020* > data/interim/broughton_archipelago/all_broughton_archipelago_locations_2020.csv
		csvstack data/interim/broughton_archipelago/broughton_archipelago_locations_2021* > data/interim/broughton_archipelago/all_broughton_archipelago_locations_2021.csv

.PHONY: collate-discovery-islands-data
collate-discovery-islands-data:
		csvstack data/interim/discovery_islands/discovery_islands_2017* > data/interim/discovery_islands/all_discovery_islands_2017.csv
		csvstack data/interim/discovery_islands/discovery_islands_2018* > data/interim/discovery_islands/all_discovery_islands_2018.csv
		csvstack data/interim/discovery_islands/discovery_islands_2019* > data/interim/discovery_islands/all_discovery_islands_2019.csv
		csvstack data/interim/discovery_islands/discovery_islands_2020* > data/interim/discovery_islands/all_discovery_islands_2020.csv
		csvstack data/interim/discovery_islands/discovery_islands_2021* > data/interim/discovery_islands/all_discovery_islands_2021.csv

.PHONY: collate-quatsino-data
collate-quatsino-data:
		csvstack data/interim/quatsino/quatsino_2016* > data/interim/quatsino/all_quatsino_2016.csv
		csvstack data/interim/quatsino/quatsino_2017* > data/interim/quatsino/all_quatsino_2017.csv
		csvstack data/interim/quatsino/quatsino_2018* > data/interim/quatsino/all_quatsino_2018.csv
		csvstack data/interim/quatsino/quatsino_2019* > data/interim/quatsino/all_quatsino_2019.csv
		csvstack data/interim/quatsino/quatsino_2020* > data/interim/quatsino/all_quatsino_2020.csv
		csvstack data/interim/quatsino/quatsino_2021* > data/interim/quatsino/all_quatsino_2021.csv
		
.PHONY: collate-clayoquot-data
collate-clayoquot-data:
		csvstack data/interim/clayoquot/extracted/clayoquot_2016* > data/interim/clayoquot/assembled/clayoquot_2016.csv
		csvstack data/interim/clayoquot/extracted/clayoquot_2017* > data/interim/clayoquot/assembled/clayoquot_2017.csv
		csvstack data/interim/clayoquot/extracted/clayoquot_2018* > data/interim/clayoquot/assembled/clayoquot_2018.csv
		csvstack data/interim/clayoquot/extracted/clayoquot_2019* > data/interim/clayoquot/assembled/clayoquot_2019.csv
		csvstack data/interim/clayoquot/extracted/clayoquot_2020* > data/interim/clayoquot/assembled/clayoquot_2020.csv
		csvstack data/interim/clayoquot/extracted/clayoquot_2021* > data/interim/clayoquot/assembled/clayoquot_2021.csv

# Extract and collate all in one step:

.PHONY: all
all: extract collate

.PHONY: extract
extract: extract-broughton-archipelago-data extract-discovery-islands-data extract-quatsino-data extract-clayoquot-data

.PHONY: collate
collate: collate-broughton-archipelago-data collate-discovery-islands-data collate-quatsino-data collate-clayoquot-data

# Clean directories when needed

.PHONY: clean
clean:
		rm -f data/interim/broughton_archipelago/*
		rm -f data/interim/discovery_islands/*
		rm -f data/interim/quatsino/*
		rm -f data/interim/clayoquot/extracted/*


.ONESHELL:
.PHONY: pdf-info
pdf-info:
		for pdf in data/raw/broughton_archipelago/*.pdf; do \
			echo "Name: $$pdf"; \
			pdfinfo "$$pdf" | grep -E "Producer|Optimized|PDF version"; \
			echo "\r\n"; \
		done
		for pdf in data/raw/discovery_islands/*.pdf; do \
			echo "Name: $$pdf"; \
			pdfinfo "$$pdf" | grep -E "Producer|Optimized|PDF version"; \
			echo "\r\n"; \
		done
		for pdf in data/raw/quatsino/*.pdf; do \
			echo "Name: $$pdf"; \
			pdfinfo "$$pdf" | grep -E "Producer|Optimized|PDF version"; \
			echo "\r\n"; \
		done
