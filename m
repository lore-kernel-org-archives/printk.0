Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986539;
	b=mE64uI2gagI1GPz1Nk2tPxA4nH/9CJNzftoTdCJkKRn3LXFt4FZPYjot84s4ahUq44mW
	 bfRPxDgX5zNDardnwJfamSJsApXuv+syDYL8j0xmB9+0CfDan1lWspTfVIEf3Sf7oQQub
	 JHvIBJ8XyCMYTvbsNfRo2AotR0KLXmILZ4tN62US0Q0MTJmQJQt0EzvTNzqdS5gDWRnQD
	 h6KO15uSUf8tD9E69SuCtmAwl+AZUrU49cTJsn7jHWSc6HmX5RALuDDqOi+W0UQvqxSMP
	 86Ll8DB+nLVwPYvCH270j7DcXjQEcs1esRIJDtRBdUPjlk24Yn9DDlx50Ls8dOyz5Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986539;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2UXkAwHNfa7anmYIsYgkvRB9LCek7Y+GcrWZO1ZqEmQ=;
	b=J7uRCD33BSd0O/i/uPT/XMDHv3McM3yqW3pQ0nq5CPCFomYhLYSddzGDNeL8c2SiaGGd
	 H1yHMMyEdoa2N/D7Luk5rZvwaFPaqHLDi2XWnNjH0tBcNXRnY4O049a7okO0S59KO490n
	 IGJTvYHWqes6eFlfiIuk4JcSagmz0oa4u0E11Hm7XfCdqAdWlewoQKSTrCV152MCFRZo6
	 ng5a20OogXLI4MdE8ZHx9aA97FDPCtIqgGr3F38I7DsDjXM5U+QH3mK6g+4/QKN4BPja0
	 sGJfozXl9zqj4j3a+/Df9eIdJytSZyPzQN5a3+BwguN2vngkjFhDLZOnHRcl84+Ng+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vp+Hfpls;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C7C606A330
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vp+Hfpls
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C34E1F0089F;
	Fri,  6 Nov 2026 17:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793986539;
	bh=2UXkAwHNfa7anmYIsYgkvRB9LCek7Y+GcrWZO1ZqEmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vp+Hfpls195u3V/jn5RDkXi/m0Dk6fZ5qBKDWS9adavmS36HgOqOIu06F/QzxvBG5
	 OIZmwhejA5U1Xo036IhgwakBNSsBRFT7lt0kE4G+J2Ywnka/rDfq5UPZbn1nEcVW0D
	 d/CRvbGD343Y7v5nJqpA77+gnqj9T129PdJMPGTF3gxHa0nvW+P1ghnenkfhU+OOeU
	 MY9muejQCfchXY5SL/ERSTWfBRV4FvsVilTg1Iow3NdG7qAeaa+KOK2c/sTjOyAzXC
	 EcC8GBQ79ipsCCp3AVnGEwvzNMVeulSZ5yjaa9/gMkguySEqhUTMuBiAoAK9JVXm5z
	 owTHnDLtAHZZw==
Message-ID: <sashiko-outbox-201948@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 16/16] printk: Try enable preferred consoles only
 when there are any
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petr Mladek" <pmladek@suse.com>, "John Ogness" <john.ogness@linutronix.de>
Cc: "Sergey Senozhatsky" <senozhatsky@chromium.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Marcos
 Paulo de Souza" <mpdesouza@suse.com>, "Chris Down" <chris@chrisdown.name>, "Naveen
 Kumar Chaudhary" <naveen.osdev@gmail.com>, printk@lists.linux.dev
In-Reply-To: <20261106171952.207909-17-pmladek@suse.com>
References: <20261106171952.207909-1-pmladek@suse.com>
 <20261106171952.207909-17-pmladek@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 17:35:38 +0000
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
- [Medium] printk: try_enable_console() skips preferred console updated
  with brl
--

commit 72647c5e02d15452d74306497aa4961e3c65fa1a
Author: Petr Mladek <pmladek@suse.com>

printk: Try enable preferred consoles only when there are any

This commit moves the try_enable_preferred_console() calls into the else
branch of the list_empty(&preferred_dev_console) check in
try_enable_console().

> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index bbef405141573..a45a6fae91669 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -4103,7 +4103,7 @@ static int try_enable_default_console(struct consol=
e *newcon)
> =20
>  static int try_enable_console(struct console *newcon)
>  {
> -	int err;
> +	int err =3D -ENOENT;
> =20
>  	/*
>  	 * First, try to enable the console driver as a Braille console.
> @@ -4142,16 +4142,24 @@ static int try_enable_console(struct console *new=
con)
>  			if (err !=3D -ENOENT)
>  				return err;
>  		}
> -	}
> +	} else {
> +		/* See if this console matches one we selected on the command line */
> +		err =3D try_enable_preferred_console(newcon, true);
> +		if (err !=3D -ENOENT)
> +			return err;
> =20
> -	/* See if this console matches one we selected on the command line */
> -	err =3D try_enable_preferred_console(newcon, true);
> -	if (err !=3D -ENOENT)
> -		return err;
> +		/* If not, try to match against the platform default(s) */
> +		err =3D try_enable_preferred_console(newcon, false);
> +		if (err !=3D -ENOENT)
> +			return err;
> +	}

[Severity: Medium]
Can this skip a preferred console if the command line specifies the same
console first without Braille options and then again with them (for
example, console=3DttyS1,115200 console=3Dbrl,ttyS1,115200)?

When __add_preferred_console() matches an existing entry, it calls
add_or_update_preferred_console() with is_new_entry set to false:

kernel/printk/printk.c:add_or_update_preferred_console() {
    ...
	if (is_new_entry) {
		pc->options =3D options;
		braille_set_options(pc, brl_options);
	}
    ...
	if (brl_options) {
		want_braille_console =3D true;
		list_del_init(&pc->preferred_dev_node);
	} else if (!is_braille_console_preferred(pc)) {
		list_move(&pc->preferred_dev_node, &preferred_dev_console);
	}
}

Because braille_set_options() is only called when is_new_entry is true,
pc->brl_options remains NULL and try_enable_braille_console() ignores the
entry.  At the same time, the if (brl_options) branch unlinks
pc->preferred_dev_node from preferred_dev_console.  If no other
non-Braille console is preferred, preferred_dev_console is now empty, so
this regression prevents try_enable_preferred_console() from running and
leaves the console either disabled (if another default console registers
first) or enabled with default index 0 and NULL options via
try_enable_default_console().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106171952.2079=
09-1-pmladek@suse.com?part=3D16
