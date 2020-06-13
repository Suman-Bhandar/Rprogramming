# Calculate Euclidean distance between the occupations
dist_oes <- dist(oes, method = "euclidean")

# Generate an average linkage analysis 
hc_oes <- hclust(dist_oes, method = "average")

# Create a dendrogram object from the hclust variable
dend_oes <- as.dendrogram(hc_oes)

# Plot the dendrogram
plot(dend_oes)

# Color branches by cluster formed from the cut at a height of 100000
dend_colored <- color_branches(dend_oes, h = 100000)

# Plot the colored dendrogram
plot(dend_colored)

dist_oes <- dist(oes, method = 'euclidean')
hc_oes <- hclust(dist_oes, method = 'average')

library(tibble)
library(tidyr)

# Use rownames_to_column to move the rownames into a column of the data frame
df_oes <- rownames_to_column(as.data.frame(oes), var = 'occupation')

# Create a cluster assignment vector at h = 100,000
cut_oes <- cutree(hc_oes, h = 100000)

# Generate the segmented the oes data frame
clust_oes <- mutate(df_oes, cluster = cut_oes)

# Create a tidy data frame by gathering the year and values into two columns
gathered_oes <- gather(data = clust_oes, 
                       key = year, 
                       value = mean_salary, 
                       -occupation, -cluster)
# View the clustering assignments by sorting the cluster assignment vector
sort(cut_oes)

# Plot the relationship between mean_salary and year and color the lines by the assigned cluster
ggplot(gathered_oes, aes(x = year, y = mean_salary, color = factor(cluster))) + 
  geom_line(aes(group = occupation))

#Cool huh! From this work it looks like both Management & Legal professions (cluster 1)
#experienced the most rapid growth in these 15 years.
#Let's see what we can get by exploring this data using k-means.