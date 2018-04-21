---
layout: home
title: list
---

<div class="section">
	<div class="container">

		{% include header.md %}
		{% include scope.md %}

	</div>
</div>


  <div class="section">

	  <div class="container">

		{% for year in site.data.cons.years %}

		{% assign works = site.data.researchData | where: "year", year %}

		{% if works.size > 0 %}

		<div class="row" id="year{{ year }}">
			<div class="col-sm-12">

				<div class="well">{{ year }}년도
					<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
				</div>


			{% for work in works %}

			<blockquote class="work">

				<p class="title">{{ work.title }}

					{% if work.localfile %}
					<a href="{{ site.baseurl }}{{ site.custom.localfilepath }}/{{ work.year }}-{{ work.noo }}.{{ work.localfile }}" target="_blank">
						<span class="glyphicon glyphicon-cloud-download" aria-hidden="true"></span>
					</a>
					{% endif %}

					{% if work.ref %}
					<a href="{{ work.ref }}" target="_blank">
						<span class="glyphicon glyphicon-link" aria-hidden="true"></span>
					</a>
					{% endif %}

					<a href="#year{{ work.year }}">
						<span class="glyphicon glyphicon-triangle-top" aria-hidden="true"></span>
					</a>
				</p>

				{% if work.titleEn %}
				<p class="titleEn">
					{{ work.titleEn }}
				</p>
				{% endif %}

				<footer class="author">{{ work.author }}.
					<cite title="Source Title">{{ work.published.by }}. {{ work.year }};{{ work.published.vol }}:{{ work.published.page }}</cite>
				</footer>

				{% if work.summary %}
				<div>
					  <p class="text-success summary">
						  {{work.summary}}
					  </p>
				</div>
				{% endif %}

				{% if work.memo %}
				<ul class="text-info memo">
					{% for memo in work.memo %}
					<li >{{ memo }}</li>
					{% endfor %}
				</ul>
				{% endif %}

			</blockquote>

			{% endfor %}

		</div>
	</div>
		{% endif %}
		{% endfor %}

	</div>
</div>
