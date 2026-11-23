Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795472114;
	b=yKHOtfS6bSoPG+X5PiFoitaQpqmMzL4ahVY814XEZDMb/TYTl9ndcWYUG6yko64sKktS
	 8J4VmijfQeFRVXrUxmIGXxBr9r3vkv1k+HyNLCb7SpwB9L3Xbtnef+hV84lL/3o/byKf9
	 HF7Jicjq4o/Z2j2TfptijmsnPg6syu0lSnZzYi1iNP3u62cIZjj5TemPkjC5NGcD+DByg
	 CR1V1o9icUle7UMcsOQdJ71VylP3cULZJNGcncpvPN4bxCzs7Cc6znGTixJ83j7lQm6Zu
	 bp9feA3B9WsaNofkDdvHwQm6iqRR3aAYlZwf0c57wiRwVBKT+X8zUmKepMoYh6Okjvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795472114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F2nxXw1xsNQYaaD8ZR5Wp773q2x9Fzid0kC42p4+1HM=;
	b=gUq0+grm9G3IurzfNKx+4d/swxeeBagWbXJUzZQkx0oFn/yGJGqh/3bjeV94Xlq+4rVp
	 gVsoLfZumz2irlGot5NZ+2PUnPm/VAxepPftA6xc504XqSZzc3+eEtyWUv2U7QQzyjV+M
	 r80N3S1fWH86fRuorlRn0gwUlEN//1DKObKKBJSE2Su+Ij/QXPl14EDsXAlAJidwoq7Kl
	 YAASLgudk/RO0QKfO4FnuT2+GhR5AoWYJKV90YbQsktn6+3/XX3IFvn9HwA77yoeG319g
	 MLKSWAiUDXNzJ1mmVHgEp7xiU3+5olQcGP9qj8sqpE7ltCjbOc0TJhJlTdYkxFUpA8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N13g2g11;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926AA606A32E
	for <printk@lists.linux.dev>; Mon, 23 Nov 2026 22:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 926AA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N13g2g11
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-861967d1845so390489a34.2
        for <printk@lists.linux.dev>; Mon, 23 Nov 2026 14:15:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795472113; cv=none;
        d=google.com; s=arc-20260327;
        b=WUoBmx3/Z1m/Sis2oivSollyqObFDBBPViLtGBZ8nq7Azd07OPg/vVfIfbyvwSkRgW
         JZ0UwPqayLrE+WT0t66RIPQHGP5G/CNBX8rUw748YBr7GnX00+tR++xwWfcUC3dA1W2r
         sX4mjcUT+EeNK0ANBRZ4oEp5K3DbJSeYMU2bLyaVwjnysOAv1oebDJNUEZU8hHgHLkbk
         MaoOiFhmAKaCl877qa7N9yENVQ6BfR/Hkbx0l+IGSIQsJwh0uWjpQGfk+bI8u0WBKTI7
         cQq7Gh4/UI7ISVRFYorPLReAsCtSSq2cWSnMjIzqBOpouZOJAYxx7Adg8qc+E1Uac+3J
         B9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F2nxXw1xsNQYaaD8ZR5Wp773q2x9Fzid0kC42p4+1HM=;
        fh=oy6EcXSO1ySs9zwQDTyTaYGsTXeXgQ2xa9WM0OTjrF4=;
        b=TGYdol00G9S1y+dQaNFc8Nm0Qx3YwdjrBPI4yi25NDE2KkuVEefiK5zLZizjbU98mF
         Y1z5jtQvy21TukRi1oUlFm9QcDicyjCZq03kJk1anOl5xqjFjKSzK2r98VmFmKvM3jZb
         M8OQ0DeC+hLWxwPD5/vaV9Xq4WiZy3HVyxgM946F/Nbg4XeasoVH+hfZnUXIItgCocFt
         mz0oNG53Ipg3jsUmBuzEM3f5T3t+U4ynxKstvyn/15V8o6ojQZLccTRPEbKjzc6QC37a
         C6k202fTrv7BLSFwY/FZyohvZsnON84q95sWdHFuBMxX+RVC5aI1vP7N5Sa38PB1oKKy
         YM7g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795472113; x=1796076913; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F2nxXw1xsNQYaaD8ZR5Wp773q2x9Fzid0kC42p4+1HM=;
        b=N13g2g11xRLCjVbd15t4fXcaVgl7/Rg5q3rav73IEWMjnpohdvvfT7s0AWQ0FTi77i
         zvmzT3TflM65stzy2AoZQveXQKgQvVNW56zAwtwUXmdGEKH72JZ80mP7FFoJ7+7WCU9g
         JoYxr25MNAw1MCt131EYO5/gxwaEdCm7+DtPVY+lrekZ7Rcat/J1PkS3LVeG2JqQ1X2X
         Gyei9mbBpNuIaAQzJodvCmrHY1kHbP3jL7fJpAk4idswFzoTk2RPwaMH60eOqEMMTPWT
         BN3eET83SOOatpw0Ncb+wHKlXcaJepMzZg/rFQuRcVEjiQ/VnQaFbYP3MK9Cl3TLezwq
         +7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795472113; x=1796076913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2nxXw1xsNQYaaD8ZR5Wp773q2x9Fzid0kC42p4+1HM=;
        b=CMATIhuLKBGVkvlmCVXBc6/Iy2dJ1eI/xFzz1jo9oN9oBa/ntu/JMhQCx8/e72u/Ek
         k4DumhG0wGW5pbQiWtP8n7KKDLscrhrjWhJ3yd5yvBvpWx/cbVxbtE+oR7D+dOan9M4j
         wbfGnS5MlKz05pHyyvwmgsVB04p1P+ruOaVtoIjHZqyXOPcgdTUnsWNmQFct1wv9DVsS
         e0Kxsj2eZwQHHkBmq/GuHB1BILb84NdgjT37XgWS3omosAYRnd/pkZ3mEhyDaLvP/pZs
         VVA9YF8BaU5OOYMr7zMzkYVSfifdmdrvHFgNlMJrDd5+GCuuPcbuIfPmkQ7DaDZMp9uF
         9Low==
X-Forwarded-Encrypted: i=1; AL+hErGDra+6itkQbAV5Iu/7KvGmn+rQjqXPHsiMQOp5zm3xaVSC9TJJcuTwDjPEG0+8Dqv7ooHtAH0=@lists.linux.dev
X-Gm-Message-State: APuU4Z88bB+NN4+YUIecj2DhPoewF3it7KequWdtLdDol+assweSNvFW
	RinpQ9NGvQkbkjMbcD4c3tzPTk0U3xaufhpYnN+uikCGTUxpED23EqxbbmWJVE4DUZXEzSXinDI
	+e5yeshRAVUXoET4tGGHPk37yv42Vrog=
X-Gm-Gg: AZFdTZcyNSC7JGKd5GPht5tqIXhz5Q7KmOz4b+Wj6oltaykor0mklbwoZxAybxlqOU+
	pHiRiTF0NCwT4HBk03bg/gjvigdaCYdgNRJDJicjK+YEDBbeVcwWSyRuo0XqRQBhgZoDpPhQdmd
	RKoSJxmKoqY5ddxi3k9lbAHf1RBHGNP1t3y5jfFy8Xwk5DExT2/8dsom3z9sM6FlcxKG5dI2rhu
	DyUjQnEanSW2JOyX9XPQKXIs8ZwCPu3C4t2NmV1WorakiJrQAr8tIbmtsvJWvroL4ujovrjM/sM
	OF6Grje82CrPKSYPtS3OkBjzdzISGooERXyhvVNHTNnYuLP8MfEmXd+DekZ2HxOqcacpAb01h4U
	PdcOhBdYvibas6prrNVLjtq9gb7yH7RNegH+/jsH8jZ1RJwUjG/Dp5A==
X-Received: by 2002:a05:6808:3199:b0:4e8:b729:3ebe with SMTP id
 5614622812f47-57a0b953d28mr19799401b6e.4.1795472113383; Mon, 23 Nov 2026
 14:15:13 -0800 (PST)
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261121163557.963029-1-john.ogness@linutronix.de>
In-Reply-To: <20261121163557.963029-1-john.ogness@linutronix.de>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Mon, 23 Nov 2026 22:15:02 +0000
X-Gm-Features: Aa3M54r8PgRgIYfuYsniaBnSQY5MIggTDgAoabLc7fQl-pQOC2s44IKG_HVebgI
Message-ID: <CAGSyskX=DHDJiUxWOqG5_rYhA=OGoHbe_=GtGbOPsGPfgZAonQ@mail.gmail.com>
Subject: Re: [PATCH printk v4 0/8] Introduce policies for unsafe flushing
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Rio <rioo.tsukatsukii@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bradley Morgan <brads@mainlining.org>, Pnina Feder <pnina.feder@mobileye.com>, 
	Alessandro Carminati <acarmina@redhat.com>, Gal Pressman <gal@nvidia.com>, Baoquan He <baoquan.he@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Dave Young <ruirui.yang@linux.dev>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Oleg Nesterov <oleg@redhat.com>, 
	Bradley Morgan <include@grrlz.net>, Alex Elder <elder@riscstar.com>, 
	"Cen Zhang (Microsoft)" <blbllhy@gmail.com>, Petr Pavlu <petr.pavlu@suse.com>, kexec@lists.infradead.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 4:36=E2=80=AFPM John Ogness <john.ogness@linutronix=
.de> wrote:
>
> v3 is here [0].
>
> Until now unsafe flushing is only performed at the very end of
> panic(), before entering the infinite loop. For other situations
> (such as panic-kexec or panic-reboot or emergency-reboot) no
> unsafe flushing is performed. The reasoning for this is because
> an unsafe flush could lead to fireworks, which could prevent the
> kexec or reboot from occurring.
>
> However, some users may be willing to take on such risks in order
> to see panic output. Indeed, for the netconsole (which does not
> support safe atomic printing) it is a regression that such unsafe
> printing does not occur. [1]
>
> This series adds unsafe flushing policy flags per-console to
> allow individual consoles to perform unsafe flushing for such
> scenarios. The unsafe flushing is hard-code-enabled for the
> netconsole in patch 8/8. The justification is that this is not
> less safe than the legacy netconsole.
>
> Later these policy flags could be easily exposed to userspace
> via /sys/class/consoles/, once the sysfs per-console interface
> is available.
>
> The first 5 patches have no functional changes.
>
> Changes since v3:
>
> - Restore WARN for non-panic hostile takeover attempts and
>   expand the comment so I don't attempt this again.
>
> - Rename nbcon_allow_unsafe_takeover() to nbcon_allow_unsafe()
>   because it now allows general unsafe usage and not
>   specifically hostile takeovers.
>
> - In __nbcon_atomic_flush_pending(), additionally use
>   panic_on_this_cpu() to determine if a hostile takeover is
>   allowed.

Thanks for following up on this, John!
This version looks good to me. Netconsole needs more work before we
can have a completely safe write_atomic(), but this will allow users
to make a choice between reboot safety and observability.

I tested it triggering a crash with and without kdump enabled, from
normal context and from NMI context (simulating panic on hardlockup).
In all cases it fixed the regression: messages were sent correctly via
netconsole with no unexpected errors or warnings.

For the series:
Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
Tested-by: Gustavo Luiz Duarte <gustavold@gmail.com>
