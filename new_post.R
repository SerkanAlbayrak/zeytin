new_post <- function(..., open = TRUE) {


  tmp <- distill::create_post(title="Baslik", edit = FALSE)

  yaml <- readLines(tmp, n = 12)

# yaml <- 'title: "About this blog"
# description: |
#   Some additional details about the blog
# ---
#
# '


  con <- file(tmp, open = "w")

  on.exit(close(con), add = TRUE)

  body <-
    '

```{r setup, echo = TRUE, results = "hide", warning = FALSE, message = FALSE}
knitr::opts_chunk$set(echo = TRUE, warning = FALSE, message = FALSE)

Sys.setlocale("LC_CTYPE", "turkish")

```

<!-- TOC JAVASCRIPT ELEMENTS -->
<script>
function toggle () {
  document.getElementById("TOC").classList.toggle("hide");
};

window.addEventListener("DOMContentLoaded", () => {

  const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      const id = entry.target.getAttribute("id");
      if (entry.intersectionRatio > 0) {
        document.querySelector(`[href="#${id}"]`).parentElement.classList.add("active");
      } else {
        document.querySelector(`[href="#${id}"]`).parentElement.classList.remove("active");
      }
    });
  });

  // Track all headings that have an `id` applied
  document.querySelectorAll("h1[id], h2[id], h3[id], h4[id], h5[id], h6[id]").forEach((h1, h2, h3, h4, h5, h6) => {
    observer.observe(h1, h2, h3, h4, h5, h6);
  });

});
</script>

<!-- TOC HTML ELEMENTS -->
<input type="button" class="d-article-with-toc" id="TOC" value="&#x2630" title="Toggle (Hide/Show) Table of Contents" alt="Toggle button for hiding/showing the Table of Contents" onclick="toggle()" style="padding:7px; border: 0px;"/>
'

xfun::write_utf8(yaml, con)
xfun::write_utf8(body, con)

if (open == TRUE) usethis::edit_file(tmp)

}
