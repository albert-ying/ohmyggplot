#-----------------------------------------------------------------------------
#' better_ggplot_default()
#' @importFrom ggthemes geom_rangeframe theme_tufte
#' @importFrom ggplot2 geom_point ggplot_build scale_fill_viridis_c scale_color_viridis_c guides coord_cartesian update_geom_defaults margin
#' @importFrom hrbrthemes theme_ipsum
#' @importFrom grid unit
#' @importFrom ggtext element_markdown
#' @importFrom ggsci scale_color_npg scale_fill_npg
#' @export
#-----------------------------------------------------------------------------

oh_my_ggplot = function() {
  ## change global theme settings (for all following plots)
  ## fall back theme
  theme_set(
   theme_ipsum(plot_title_size = 28, subtitle_size = 22, base_size = 18, axis_title_size = 24, strip_text_size = 22, base_family = "Helvetica", axis_title_just = "mc") +
     theme(
       plot.title.position = "plot", plot.caption.position = "plot", legend.position = "right", plot.margin = margin(25, 25, 10, 25),
       axis.ticks = element_line(color = "grey92"), panel.grid.major = element_blank(),
       legend.text = element_text(color = "grey30"),
       plot.subtitle = element_text(color = "grey30"),
       plot.caption = element_text(margin = margin(t = 15))
     ) +
   theme(plot.title = element_markdown(), plot.subtitle = element_markdown(), plot.caption = element_markdown(margin = margin(t = 15)), axis.title.x = element_markdown(), axis.title.y = element_markdown())
  )
  assign(
    'scale_colour_discrete',
    function(...) {
      scale_color_npg(..., drop = F)
    },
    pos = 1
  )
  assign(
    'scale_fill_discrete',
    function(...) {
      scale_fill_npg(..., drop = F)
    },
    pos = 1
  )
  assign(
    'scale_colour_inferno',
    function(...) {
      scale_color_viridis_c(..., option = "C")
    },
    pos = 1
  )
  assign(
    'scale_fill_inferno',
    function(...) {
      scale_fill_viridis_c(..., option = "C")
    },
    pos = 1
  )
  # formals(coord_cartesian)$expand <- FALSE
  # formals(coord_cartesian)$clip <- "off"
  assign(
    'coord_cartesian',
    function(...) {
      coord_cartesian(..., clip = "off", expend = FALSE)
    },
    pos = 1
  )
  update_geom_defaults("point",list(size=3, stroke=.6, shape=21))
  # formals(geom_point)$size <- 3
  # formals(geom_point)$stroke <- .6
  options(ggplot2.continuous.colour = scale_colour_inferno)
  options(ggplot2.continuous.fill = scale_fill_inferno)
}

#-----------------------------------------------------------------------------
#' better_ggplot_default()
#' @importFrom ggthemes geom_rangeframe theme_tufte
#' @importFrom ggplot2 geom_point ggplot_build scale_fill_viridis_c scale_color_viridis_c guides guide_colorbar
#' @importFrom grid unit
#' @importFrom hrbrthemes theme_ipsum
#' @importFrom ggtext element_markdown
#' @importFrom ggsci scale_color_npg scale_fill_npg
#' @export
#-----------------------------------------------------------------------------
better_color_legend = guides(color = guide_colorbar(title.position = "top", title.hjust = .5, barwidth = unit(20, "lines"), barheight = unit(.5, "lines")))
#-----------------------------------------------------------------------------
#' better_ggplot_default()
#' @importFrom ggthemes geom_rangeframe theme_tufte
#' @importFrom ggplot2 geom_point ggplot_build scale_fill_viridis_c scale_color_viridis_c guides guide_colorbar
#' @importFrom hrbrthemes theme_ipsum
#' @importFrom ggtext element_markdown
#' @importFrom ggsci scale_color_npg scale_fill_npg
#' @export
#-----------------------------------------------------------------------------
better_fill_legend = guides(fill = guide_colorbar(title.position = "top", title.hjust = .5, barwidth = unit(20, "lines"), barheight = unit(.5, "lines"))) 
#-----------------------------------------------------------------------------
# debug
#-----------------------------------------------------------------------------
if (FALSE) {
  library(ggplot2)
  library(dplyr)
  library(OhMyggplot)
  oh_my_ggplot()

  annot_tb = data.frame(x = c(18,24), y = c(4.5,3.0), am = c(0,1), lab = c("Hi", "There"))
  p = mtcars |>
    # mutate(carb = as.factor(carb)) |>
    ggplot() +
    geom_point(aes(mpg, wt, fill = carb)) +
    labs(title="hello") +
    geom_text(data = annot_tb, aes(x, y, label = lab))
  p + better_fill_legend + theme(legend.position = "top")
  p |>
    base_mode()
  p |>
    base_facet("am", guides = "auto", nrow = 2)
  
  base_facet(p2,"am")
}
