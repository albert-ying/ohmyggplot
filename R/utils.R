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
  chinese_pal = c(
    "#f04a3a",#珊瑚红
    '#619ac3',#羽扇豆蓝
    '#d6a01d',#土黄
    '#12aa9c',#美蝶绿
    '#806332', #苍黄
    '#eea6b7',#晶红
    '#96c24e',#芽绿
    '#2b333e',#青灰
    '#a4aca7',#冰山蓝
    '#f8f4ed', #汉白玉
    '#82111f',#殷红
    '#134857', #苍蓝
    '#22a2c3',#海青
    '#7e1671',#魏紫
    '#1661ab',#靛青
    '#f04b22',#大红
    '#1ba784'#竹绿
  )
  # chinese_pal = c(

  # )
  assign(
    'scale_colour_discrete',
    function(...) {
      scale_color_manual(..., values = chinese_pal, drop = F)
    },
    pos = 1
  )
  assign(
    'scale_fill_discrete',
    function(...) {
      # scale_fill_npg(..., drop = F)
      scale_fill_manual(..., values = chinese_pal, drop = F)
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
  update_geom_defaults("point",list(fill = "gray35", size=3, stroke=.7, shape=21, height = 0))
  update_geom_defaults("line",list(size=0.7))
  # update_geom_defaults("bar",list(size=0.7, colour = "black"))
  update_geom_defaults("col",list(size = 0.7, colour = "black"))
  update_geom_defaults("boxplot",list(stroke=0.7, width = 0.8, colour = "black"))
  update_geom_defaults("violin",list(stroke=0.7, width = 0.8, colour = "black"))
  update_geom_defaults("smooth",list(color = "firebrick", fill = "firebrick", alpha = 0.05, size = 0.7))
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
  library(hrbrthemes)
  library(ggtext)

  ohmyggplot::oh_my_ggplot()

  {
  oh_my_ggplot()
  tibble(X = c(1:16), y = rep(10,16)) |>
    mutate(X = as.character(X)) |>
    ggplot(aes(X, y)) +
    geom_col(aes(fill = X))
  }

  iris |>
    ggplot(aes(Petal.Length, Petal.Width, fill = Species)) +
    geom_point() +
    geom_smooth(aes(color = Species))

  cars |>
    tibble() |>
    mutate(type = rep(1:10, 5)) |>
    mutate(type = as.character(type)) |>
    ggplot(aes(speed, dist, fill = type)) +
    geom_point(alpha = 0.8)
    # geom_text(data = annot_tb, aes(x, y, label = lab))
  p + better_fill_legend + theme(legend.position = "top")
  p |>
    base_mode()
  p |>
    base_facet("am", guides = "auto", nrow = 2)
  
  base_facet(p2,"am")
}
