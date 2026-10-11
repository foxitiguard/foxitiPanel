
<footer class="app-footer">
	<div class="container">
		<div class="app-footer-info">
			<p class="app-footer-brand">
				<a href="https://foxitiguard.com/"
				   class="app-footer-link"
				   target="_blank"
				   rel="noopener noreferrer">
					<strong>FOXITI Panel</strong>
				</a>
				<span>v<?= htmlspecialchars($_SESSION["VERSION"] ?? "", ENT_QUOTES, 'UTF-8') ?></span>
			</p>

			<p class="app-footer-tagline">
				Lightweight & Powerful Control Panel
			</p>

			<p>
				<strong>Developed by:</strong>
				Foxitiguard Technologies Bangladesh
			</p>

			<p>
				<strong>Address:</strong>
				348 Hatkhola Road, Jessore, Bangladesh-7400
			</p>

			<p>
				<strong>Website:</strong>
				<a href="https://foxitiguard.com/"
				   target="_blank"
				   rel="noopener noreferrer">
					foxitiguard.com
				</a>
			</p>

			<p class="app-footer-made-in">
				🇧🇩 Made in Bangladesh
			</p>

			<p class="app-footer-copyright">
				&copy; <?= date("Y") ?>
				<a href="https://foxitiguard.com/"
				   target="_blank"
				   rel="noopener noreferrer">
					Foxitiguard Technologies Bangladesh
				</a>.
				All rights reserved.
			</p>
		</div>
	</div>
</footer>
