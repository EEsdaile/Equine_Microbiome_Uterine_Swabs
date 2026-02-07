rule all:
	input:
		"04.ancombc_number_of_paths.qzv",
		"04.da_barplot_number_of_paths.qzv"

rule collapse_to_species: 
	input:
		table="03_table_uterine_swab_filter_taxa_samples_reads_greengenes.qza",
		taxon="/projects/c829993361@colostate.edu/microbiome_taxonomy/greengenes_2022.10/ftp.microbio.me/greengenes_release/current/2024.09.taxonomy.asv.tsv.qza"
	output:
		"04_table_collapsed_L7.qza"
	shell:
		"qiime taxa collapse \
		--i-table {input.table} \
		--i-taxonomy {input.taxon} \
		--p-level 7 \
		--o-collapsed-table {output}"


rule run_ancom:
	input:
		table="04_table_collapsed_L7.qza",
		meta="metadata.txt"
	output:
		"04.ancombc_number_of_paths.qza"
	shell:
		"""qiime composition ancombc \
		--i-table {input.table}
		--m-metadata-file {input.meta} \
		--p-formula 'Number_of_Pathogens' \
		--o-differentials {output}"""

rule vis_ancom:
	input: 
		"04.ancombc_number_of_paths.qza"
	output:
		"04.ancombc_number_of_paths.qzv"
	shell: 
		"qiime composition tabulate \
		--i-data {input} \
		--o-visualization {output} "

rule ancom_barplot:
	input:
		"04.ancombc_number_of_paths.qza"
	output:
		"04.da_barplot_number_of_paths.qzv"
	shell:
		"""qiime composition da-barplot \
		--i-data {input} \
		--p-significance-threshold 0.001 \
		--p-label-limit 5000 \
		--p-level-delemiter ';' \
		--o-visualization {output}"""
	
