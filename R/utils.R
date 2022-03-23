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
    theme_ipsum(
      plot_title_size = 28,
      subtitle_size = 24,
      base_size = 18,
      axis_title_size = 20,
      strip_text_size = 24,
      base_family = "Helvetica",
      axis_title_just = "mc"
    ) +
      theme(
        plot.title.position = "plot",
        plot.caption.position = "plot",
        legend.position = "right",
        plot.margin = margin(5, 15, 5, 15),
        axis.ticks = element_line(color = "grey92"),
        panel.grid.major = element_blank(),
        # legend.text = element_markdown(color = "grey30"),
        axis.text.x = element_markdown(margin = margin(t = 5)),
        axis.text.y = element_markdown(margin = margin(r = 5)),
        plot.title = element_markdown(),
        plot.subtitle = element_markdown(),
        plot.caption = element_markdown(margin = margin(t = 15)),
        axis.title.x = element_markdown(),
        axis.title.y = element_markdown()
    )
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
  update_geom_defaults("point",list(fill = "gray28", size=3, stroke=.6, shape=21, height = 0))
  update_geom_defaults("line",list(size=0.7))
  update_geom_defaults("smooth",list(color = "firebrick", fill = "firebrick", alpha = 0.05))
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
  library(ggRetro)
  library(ohmyggplot)
  library(ggplot2pipes)
  library(paletteer)
  oh_my_ggplot()
  scale_colour_discrete = function(...) 
  # init_ggplot2_pipes()
  annot_tb = data.frame(x = c(18,24), y = c(4.5,3.0), am = c(0,1), lab = c("Hi", "There"))
  mtcars |>
    mutate(x = "A  very very very very very") |>
    ggplot() +
    geom_point(aes(vs, wt, fill = as.factor(wt))) +
    labs(title="ho") +
    scale_fill_paletteer_d("cartography::pastel.pal")
    theme(axis.text.y = ggtext::element_markdown()) +
    scale_x_discrete(labels = scales::label_wrap(10)) |> base_mode() +
    scale_y_continuous(labels = ~ glue::glue("10^{.x}")) +
    NULL

    
    # geom_text(data = annot_tb, aes(x, y, label = lab))
  p + better_fill_legend + theme(legend.position = "top")
  p |>
    base_mode()
  p |>
    base_facet("am", guides = "auto", nrow = 2)
  
  base_facet(p2,"am")
}
