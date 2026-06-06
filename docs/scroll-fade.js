document.addEventListener("DOMContentLoaded", function () {
  const sections = document.querySelectorAll("p, h2, h3, img, .about-links");
  sections.forEach(el => el.classList.add("fade-in-section"));

  const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add("visible");
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.01, rootMargin: "100px 0px 0px 0px" });

  sections.forEach(el => observer.observe(el));
});