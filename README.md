# ＡＥＳＴＨＥＴＩＣ　ＰＬＯＴＴＩＮＧ

Do your ggplots lack a certain ＡＥＳＴＨＥＴＩＣ？

Do you wish they could feel more like a robotrip in a Kmart in 1989?

If so, this is the package for you!

# Installation

`devtools::install_github("mackenziedg/aestheticr")`

# Usage

For ggplot, something like

```{r}
library(aesthetic)


ggplot(data=iris, aes(x=Sepal.Width, y=Sepal.Length, color=Species)) +
  geom_point() + 
  scale_color_manual(values=aesthetic(name="crystalpepsi", n=3))
```

should work.

The `scale_<type>_manual()` functions will allow customization of the palette for ggplot2().

View the different palettes with `print.palette(aesthetic("name"))`.

# Credit

The color palettes were taken from https://github.com/dantaki/vapeplot, and the skeleton for the R package was taken from https://github.com/karthik/wesanderson.

# License

This package is licensed under the GPL 2.0.


