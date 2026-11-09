Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239157;
	b=ipTzrxevSc+aLkcE6yimx7GRsaw3P4X27YpE0bg0ScHbnodpN6vicVxDXsXv8xK/NF8U
	 uQhmLgKa5P3L8ULfz/6R7PGGvz0esQcs4amvQXy3iyb3+vtMjeVPAQHEBJbrcOdpCF11u
	 Kcr/Ye3bNTS/iv1HBK5qylcfxmjpYPMpQ/1FsJGsfuXB3HGcwl19QDTWocmunyWDmVx9e
	 aIyXsdyknLrYFDFsV238jOHubLHNnuOmTjxQRJI0tKLMrzk2NoABOtXVEGN8oeqtgj59P
	 z2qKDFAyTUygz1A51BVpPliErJ2g0PC+1jpo5d/vUVG9G3oFVHMNzq3bJA3pjz0enDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6LYtK+tbTD2I98lblh8z72sGlAc9Xb6Dd1FXdrWY3z8=;
	b=uoCuTrIl2s1uy6jbG6VbTdJLOEdau0h46+S2sMjeE3v3he6JRuXKEoee0IFEYUAb5vAO
	 H5zW5ow2cJ32LsZ7SwKiLBjO/mSlQ5CrSETtxs2GpZjkyBmZOjI4QcqrvsIKtafDqlTKw
	 BhqA0LsJVxbGOxWhu3o8mQkzysUuapNVgTbZS5K5UjGP5JIlkYR9DPUlpYNrTlhnWeE6x
	 09vltA8HUq7UeLaqIkiPWzQ8XkfOpp7XaSyYQErYL/sUPdHtRJsL+aPScRr92qsk0xFH8
	 0ivOJ64N/SLl3kLOT8HUlz8VDtuOSDj/BJ3wKY0/N6JiwX5EVKrulJxhw1sY1DQO7dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HIfjvnG8;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E1B606A325
	for <printk@lists.linux.dev>; Mon,  9 Nov 2026 15:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E1B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HIfjvnG8
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so8822335e9.0
        for <printk@lists.linux.dev>; Mon, 09 Nov 2026 07:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794239156; x=1794843956; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LYtK+tbTD2I98lblh8z72sGlAc9Xb6Dd1FXdrWY3z8=;
        b=HIfjvnG89tjTf4tTijXQmEz7fFnH+Hm4r+ObdODO4GaRHEnBNfEK2Bk2NRurh8myed
         n4S7GfLg70QiHrZYCBUf8vpMsVSiLrJwIZZlN0WCcAG1IPqcB+3YJhhf2TU1OM6BnFFg
         /OzYBO5IONbq2kHziJV9uX3CQaelxyuyvti5FKkFhMrj0NfiokbLDDhu2cM1KtCmi5eM
         5Dp5IWen6Gp7Ju/WC3ZEgV2DBK1eGWzqnGxrLDwiUTPU4tiaBE/g9RyWZUlj2Z+s+I1u
         Egi6AUg4I6tJpk3QS/pMNI1Sw8NTUiqTrls6qhgj7thK4Z9zmprdvHO/hax7s7SuaHuL
         YQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239156; x=1794843956;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LYtK+tbTD2I98lblh8z72sGlAc9Xb6Dd1FXdrWY3z8=;
        b=FehD7klaTGL0UhCTLO4EoeIukzUC1/GCKPK+vVulYM7t9DYwr75yH2xSVbXN2ElCph
         MUDvweB4bXQm3zVq97PbnL/A8MpQs5L0G3sQpvbZaYRNP3WEPCXcR5GbageE7L/W7+Zz
         wI8krAmaXtgyWxqoaRVj8x4zTwHD/fOywXkm8fWHuj0YZt+n1Y6bg//DJHxzUGzCY1UL
         STKIJKomR34L3T87kSmknypKiUTHsGgzrZEEdXVQyREiL79cbxK2bkE/VASJC/Pv+HQR
         kLNBFhOOiK4Fj14fILpt9kfUJ8FdToD8EMScw+r1cE9e8ri/3xnJGOotEyYny2kOk9f/
         O8HA==
X-Forwarded-Encrypted: i=1; AL+hErEkKfoYj0rKU6WMGwHR6Y5GmcsvARDo4DF9kLJiGmUDpbZWOKihgceqvNWNBuUNHryo5JP8Spg=@lists.linux.dev
X-Gm-Message-State: APuU4Z9OSiNfg8tmVglVblQkgSy6yx3Rz+T4LaggSDBvVy0XZkmHu3Lf
	ntAvDmebfHMBn9jKJjo+b3qzTwHYfWOO4Y6ZWFf6TcwnGSEOYCNJjIzQtuURS9tFSOErSFeD0i2
	9Q/hgjFY=
X-Gm-Gg: AYBFou06Bi8Y1S03rDMdQJSLwQt2x7hvJ15Gf/Ba+CojgLe4EQMAKCG4BGgAFTOxzNh
	A+kzBtNU/Hsb4cDGqnixqd8/ky1gXCv8Ak8q0FQlM2Z1QPuljDQjI2cPRhLzQBI1++JtE8tkWoE
	yNsyRqUdtyRHjFNKhe+IkNRddpcnyUeV3FM9bcmIC/jZjssKoOdraFt8/yrNS9hzbqsdskOvX3i
	K6YZRWpXGQVoWPCaxRer6wCwVSXk8QVye4eIbChMzjQpB8mOP+WtmdZl9Bo3KxxZGSz43pooj5x
	+A8bkCDmecvht/+hdmfXy+ZkOj/QtUPPKWqIiTFFnyMVVIevEdRQnz2xTADtRX+LxmVZsjqTco+
	hXbVE2EQt0Xkt1glGxrKToytGkF+WizGuMXw4ouW7FfqGSDD0ytnQQo/M8A/HSavEsZ7tj1FKDv
	mTg9AJKNo0ud2UdvMFEjzhue4f1Ztrc3A4+++tTmBUMToM+VSs3uIt8Tex8PdYt/SkVKLaCD+IU
	Tm2vgmtREG16TI5wI5HTYMCXi5OTackHG96bODaP3670dq884jXz9SoRavLXRDAz30WRG4oIFTe
	MyI3BTxQda6gBU3BnBH5ke8KWhw6cA==
X-Received: by 2002:a05:600d:82ea:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4b943f76d81mr99129045e9.0.1794239155647;
        Mon, 09 Nov 2026 07:45:55 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7d54d6f93sm397296675e9.0.2026.11.09.07.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:45:49 -0800 (PST)
Date: Mon, 9 Nov 2026 16:45:46 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/16] printk: Clean up preferred console handling
Message-ID: <avHqqoJO8C15LkpG@pathway.suse.cz>
References: <20261106171952.207909-1-pmladek@suse.com>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106171952.207909-1-pmladek@suse.com>

On Fri 2026-11-06 18:19:36, Petr Mladek wrote:
> Hi,
> 
> this patchset does some clean up of the code for handling preferred
> consoles in the console registration code.
> 
> It is a prerequisite some more patchsets, namely:
> 
>   + for Marcos' clean up of CON_ENABLE
>     flag handling. It should prevent regressions caused by the
>     hidden effects of try_enable_preferred_console(), for example,
>     see https://lore.kernel.org/r/89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com
> 
>   + for Chris' per-console log-level, see
>     https://lore.kernel.org/r/cover.1764272407.git.chris@chrisdown.name
> 
> and maybe even some more.

Heh, Sashiko AI makes things interesting. It found some real problems
which I just commented.

I have the fixes mostly ready. I wonder whether you would prefer that
I send v7 or you have already started review of v6.

I do not have strong opinion. The changes are rather simple. But the
code is not trivial so that even small changes have surprising effects.

Best Regards,
Petr
