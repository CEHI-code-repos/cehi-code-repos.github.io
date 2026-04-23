library(dplyr)
library(tidycensus)
library(tigris)
library(sf)

geo_level <- "tract"
geo_state <- "IL"
geo_year <- 2024L

il_re_2024 <- get_acs(
  geo_level,
  table = "B03002",
  year = geo_year,
  state = geo_state,
  output = "wide"
) |>
  select(
    geoid = GEOID,
    total = B03002_001E,
    nh_white_alone = B03002_003E,
    nh_black_alone = B03002_004E,
    nh_asian_alone = B03002_006E,
    hispanic = B03002_012E
  ) |>
  mutate(
    other = total - rowSums(across(where(is.numeric) & -total))
  )

il_tracts_2024 <- tracts(
  state = geo_state,
  cb = TRUE,
  year = geo_year
) |>
  select(geoid = GEOID, land_area = ALAND) |>
  mutate(land_area = land_area / 1e6) # get land area in km^2

chi_boundaries <- places(state = "IL") |>
  filter(NAMELSAD == "Chicago city")

il_tracts_2024 |>
  st_filter(chi_boundaries) |>
  left_join(il_re_2024) |>
  st_write("raceethn_acs5_24.geojson", append = FALSE)
