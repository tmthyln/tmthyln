### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 8d54fd68-48a5-11eb-1065-69348a58ec10
using Luxor

# ╔═╡ e104962c-48d6-11eb-3c1c-bf0077f236ad
using PlutoUI

# ╔═╡ 06e3eb16-48d9-11eb-13a9-85bb4cbce948
md"""
Drawing Radius: $(@bind r Slider(50:50:1000, default=100, show_value=true))
"""

# ╔═╡ e59998cc-48d6-11eb-25c8-e7bc4418a7f3
md"""
Image Padding per Edge: $(@bind padding Slider(1:50, default=10, show_value=true))%
"""

# ╔═╡ 1003a540-48d9-11eb-19e4-91c470110199
md"""
Image Dimension: $(image_dim = round(2*(1 + padding / 100) * r))
"""

# ╔═╡ 8e2dc198-48d7-11eb-2ad9-cb6b63321e91
# scale factor for graphics
x = r / 100;

# ╔═╡ a71318d2-48a7-11eb-1cb2-2f0b9667f524
cpt(θ) = r*Point(cos(θ), -sin(θ))

# ╔═╡ d3ddaa60-48c7-11eb-0894-c1a43b13fe6a
function T()
	move(cpt(4π/17))
	curve(Point(15x, -60x), Point(-20x, -55x), cpt(12π/17))
	
	carc2r(O, cpt(12π/17), cpt(16π/17))
	
	curve(Point(-60x, -35x), Point(-20x, -30x), Point(-10x, -30x))
	
	curve(Point(-15x, -5x), Point(-25x, 40x), cpt(22π/17))
	
	#curve(Point(-25, 70), Point(15, 90), cpt(27π/17))
	line(Point(40x, cpt(29π/17).y))
	
	curve(Point(-35x, 50x), Point(-10x, -40x), cpt(4π/17))
	
	closepath()
	fillpath()
end

# ╔═╡ fd231c86-48cd-11eb-0311-dde5fe6fed30
function L()
	move(cpt(4π/17))
	line(cpt(13π/17))
	#curve(Point(15, -60), Point(-20, -50), cpt(13π/17))
	
	carc2r(O, cpt(13π/17), cpt(18π/17))
	
	curve(Point(-60x, -35x), Point(-20x, -30x), Point(-10x, -35x))
	
	curve(Point(-15x, -5x), Point(-25x, 40x), cpt(22π/17))
	
	curve(Point(-25x, 75x), Point(20x, 83x), cpt(28π/17))
	
	curve(Point(-35x, 55x), Point(-10x, -40x), cpt(4π/17))
	
	closepath()
	fillpath()
end

# ╔═╡ 9aa96742-48a5-11eb-2d8e-cbd3f1591780
begin
	Drawing(image_dim, image_dim, :png, "logo.png")
	origin()
	
	sethue(0.1, 0.66, .35)
	T()
	
	rotate(π)
	
	sethue(0.1, 0.33, 0.67)
	L()
	
	rotate(π)
	
	@layer begin
		sethue(0.1, 0.66, .35)
		box(Point(-r, -r), Point(r, 0), :clip)
		T()
	end
	
	sethue("black")
	#circle(O, 1, :fill)
	
	finish()
	preview()
end

# ╔═╡ Cell order:
# ╠═8d54fd68-48a5-11eb-1065-69348a58ec10
# ╠═e104962c-48d6-11eb-3c1c-bf0077f236ad
# ╟─06e3eb16-48d9-11eb-13a9-85bb4cbce948
# ╟─e59998cc-48d6-11eb-25c8-e7bc4418a7f3
# ╟─1003a540-48d9-11eb-19e4-91c470110199
# ╠═8e2dc198-48d7-11eb-2ad9-cb6b63321e91
# ╠═a71318d2-48a7-11eb-1cb2-2f0b9667f524
# ╠═d3ddaa60-48c7-11eb-0894-c1a43b13fe6a
# ╠═fd231c86-48cd-11eb-0311-dde5fe6fed30
# ╠═9aa96742-48a5-11eb-2d8e-cbd3f1591780
