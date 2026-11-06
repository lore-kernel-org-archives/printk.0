Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986592;
	b=YMPRC2TIuUw5UFD3aEqPhoMcMhAkuqzAGh+hv0W0rPrOjV4P0LUZ6QMZ950dhzL9KT3I
	 ZHO7l0ddpACi0ZL7meYAUNSkyEbev4b+tU+QoTeK5cp8G3iQt6xelwFEzpl+LKWbnr3rH
	 UI+nQ7K9a7Yis70sPr46/686JRn59LWpZddxHLHuqD4uFhm14fxLxfBrwW/4FEEOTAjTp
	 tDshsBcQarV6gbXjZECPGUXJLPQXNh2YbxYllvXqqN4dWHx2nxV/Z4C1Uy/8kuEvr1vcZ
	 6gX7zFq9hOuWSew++cOTvA9AN9QNX6rbMsFCxJy9mahES9BzmGFocH4LwUJ78pDHawA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986592;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1USZyZn6edT6Ka/a9f0bGX5kaLzMYVjsDmNxU4DXlW4=;
	b=jicf8ZQUk1/eY0T4WDfQNwGGwuyUOgy2iFHbQT2SguWIJuKEYQZgEFCSPsvGVDVL4iH9
	 +5n3C0efIVZxc0v70WKw7Eo0LIYADxgIzU1AExturoxjnPiOAPt+jHRuuCjuTXWsvyjKY
	 tAEv3HrW6yjXwfZsmvYxI5M4sBp7PAS9TqVqYV7riZhJqK08WrkQ2wwIiJLkWDlaHLT/C
	 VZVSgefUP1FB/nak2cBJof123/I8Z4x1sb5R1dt/vxmzeodCjgAT5f/44khMVxr4wEUVp
	 7o8KtPvAmrP3zd+0BSO/OQ2VFiKq3F1yrbA4HFLD0EttU5Ed1FvJL0C79pns+odat0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hnYy+tSO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7961606A326
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hnYy+tSO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFD51F0089F;
	Fri,  6 Nov 2026 17:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793986591;
	bh=1USZyZn6edT6Ka/a9f0bGX5kaLzMYVjsDmNxU4DXlW4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hnYy+tSO8TF1OzzQFkRbO0Jv0hfKK4+C9PFIuEl8+yiBE2PNMPRGBw52csVdmEJas
	 OFzSzoXlDdLM+fw/h2V9dgTy518NzWRPMjuJm3O67rr56Z2AUo9m/mfTShDiREOlKw
	 kDCIFHlzT+4o9bLA5xtG1mgPQd4QZAWY5vUoMwd6HwUPbD+JLN/9fvTX7EX336vTvZ
	 /6nICjPg5M6y+IhwsWWDoXSxzKmn1CwE7/ctVjeMMyQc6e898eQKidCtDB6QfBEph9
	 YuEYbYw4dL4sMbQJyk50Q1REFEcAhmhYSFEcJTOBld5AmSOs6YhkEpk/xVBFBWZIOq
	 Aw4AQXaw1F34Q==
Message-ID: <sashiko-outbox-201949@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 14/16] printk: Do not set Braille console as
 preferred_console
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petr Mladek" <pmladek@suse.com>, "John Ogness" <john.ogness@linutronix.de>
Cc: "Sergey Senozhatsky" <senozhatsky@chromium.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Marcos
 Paulo de Souza" <mpdesouza@suse.com>, "Chris Down" <chris@chrisdown.name>, "Naveen
 Kumar Chaudhary" <naveen.osdev@gmail.com>, printk@lists.linux.dev
In-Reply-To: <20261106171952.207909-15-pmladek@suse.com>
References: <20261106171952.207909-1-pmladek@suse.com>
 <20261106171952.207909-15-pmladek@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 17:36:30 +0000
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] printk: inconsistent Braille state in
  add_or_update_preferred_console()
--

commit 7297fe2fd570a081c485097cb3f11fae0fc8a9d2
Author: Petr Mladek <pmladek@suse.com>

printk: Do not set Braille console as preferred_console

This commit replaces the preferred_dev_console index with a linked list of
non-Braille preferred consoles so that redefining an entry as a Braille
console does not leave preferred_dev_console pointing to a Braille entry.

> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 1aad21c082c99..efc695ca9d13c 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
[ ... ]
> @@ -2649,10 +2656,20 @@ static int add_or_update_preferred_console(unsign=
ed int i,
>  		braille_set_options(pc, brl_options);
>  	}
> =20
> -	if (brl_options)
> +	if (is_new_entry)
> +		INIT_LIST_HEAD(&pc->preferred_dev_node);
> +
> +	/*
> +	 * The last preferred console should get associated with /dev/console.
> +	 * Except for the Braille console which can't get associated with
> +	 * /dev/console.
> +	 */
> +	if (brl_options) {
>  		want_braille_console =3D true;
> -	else
> -		preferred_dev_console =3D i;
> +		list_del_init(&pc->preferred_dev_node);
> +	} else if (!is_braille_console_preferred(pc)) {
> +		list_move(&pc->preferred_dev_node, &preferred_dev_console);
> +	}

[Severity: Medium]
When an existing non-Braille entry is updated with brl_options (for
example, console=3DttyS0 followed by console=3Dbrl,ttyS0), does this leave =
pc
in an inconsistent state where preferred_dev_node is removed from
preferred_dev_console while pc->brl_options remains NULL?

braille_set_options(pc, brl_options) is only called when is_new_entry is
true, so is_braille_console_preferred(pc) still returns false after the
update.  As a result, __try_enable_preferred_console() skips pc during the
Braille pass and instead enables it as a normal console without
CON_CONSDEV, and if it was the only preferred console, preferred_dev_console
becomes empty and try_enable_console() also falls back to
try_enable_default_console().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106171952.2079=
09-1-pmladek@suse.com?part=3D14
