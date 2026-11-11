Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411665;
	b=UVMI4ZGwAtWKwJBx8V5RQC8c/VVD75ozbwHGYIvktOrHQMbQGRRovYMDa3srnx59UGGv
	 uHO5WUQjtVXgaLt3BAB8Kv7ri1Vlua0M/JGJ31TktZmVjf9nNuFCP4DnwIbonimLFl5ro
	 0TpJcFD7MPYm3eZ5QFuLasyTEeFX8rXlSdHuQnlBNzBT2FM4x3sqB7CNBzAR3yUGhWVG4
	 rBFgA2MMMOnJBZ3FAzUdKAOpFnR29rdxe4PYxvrhuJ6NZ7jMncteKJwe3ad3aOk5clSQO
	 wNVHppwjS2KmRvTz82ihFhWcFpeGvnO0dXJ8X4rz7EmNDJAF3N/ixTI8u9D9Hdf99qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Gumcpnox9RWZNFmJ4fGU2nbq4jZfZ90jzjsHQu9+HC8=;
	b=euVtq/t8ElDyshm5yrZ8vKO53NzIDIpVzc2f2AopvSGyE7a9nQ38NKwXwyqeK5snStVX
	 xyDhnylVHwDvGN4NosK1sOjqAeW4LKjm7ixkvtYp+fBZ224WeiDinY87Hp8AiE93mFycW
	 TWnKDLH1utDTPozbsFi88qmyzI70lU1aOptMCpQHTu1ELue0NrzLzEmlvCVNhtuvb3IOm
	 Ab5kMT4KWN4Un6YIA0CxvJE5JJvdeIRpLuY5fJqkDD7YItk0x7QLRXqBRYbViLS73k4m3
	 L0yOGTLnoNRrJNk06C8tmin7we0Uzu/xs9N0l4E2A0Onuo3G5Ca7lOReNX+yIWemdHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RJlPqjKU;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5CC606A335
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D5CC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RJlPqjKU
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49318428d98so1799575f8f.1
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794411662; x=1795016462; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gumcpnox9RWZNFmJ4fGU2nbq4jZfZ90jzjsHQu9+HC8=;
        b=RJlPqjKU4RXHKCXPbAYf0kd35hmZasr+7oa06a7137gbN3HQlqBtJBl0yZRU11HVgn
         DySCWereWLUm7a7RooWHdsoLZ8GyfRu+TBdaY0qUWI1rSV6oMkkZ0AIuoqqI3LPETm4t
         DGGv2LzDQU3hZEEWvSdoE90CENvh3akoqqVVjenDlLkIJD+FMw9+U96uBYIrWPkW/F7q
         ib8ou1DAZ8jNE5rH4WtTuGaGIgmiT9ELOYRTRxFwOqzhKLsfDIdlPcy6ccxaOHlUdr8X
         stBz39DAJ7nyRodSqgTvbWPW+U9Hdtv6c1eYftN/g0Pu5/mT+kykgl8kRnesvcfMy1TR
         lTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411662; x=1795016462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gumcpnox9RWZNFmJ4fGU2nbq4jZfZ90jzjsHQu9+HC8=;
        b=CLHnrfPqTWxmkgEJPBmCh+mM5tWGuAxVevTDsPCW2ATrU8dFVD2MyeUJuAgTUP9eZp
         uwjBvaWyvt6U9mn+WSOxDhleqvLjKpvAuyk9yGenBRYbUgGLOTEeSRBlR/PeQ4FXmhd2
         h4WQENSgzQWJJUMYIcJMKorm38+mCT+tAKp/xNcCdD4rOdhFNQTO/C/rOuMYJGXUMha5
         NUHArlnZH4FA8kHfXCGn2wkWQVvLoUS4Hhl+Zos2eT1nyy3qcA93mpHKEWCbkfQ72UPA
         N5a4dJcIZuAi9hWHQbiBjUR9t6xHEfZIc4/IawRBrXIk5gk2+27so170Yc2dyUeLUiW8
         xtBg==
X-Forwarded-Encrypted: i=1; AL+hErGeWmlDh/hcQU2Ppexr6dvXemBZq/PGmJeadUkqw8yeam2yiC7W4wdXSUKGK36RIGECZqsIXZI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8YyMDIpfMN7XxgAOwa6c7Lfj7b0eLwMnGj7G2K8s1Y7strZnUD
	b0R4f6WWXX2rukSAfH2wY/ugM1blDk+IYWkPbV7AsbqCd1V1tvBdizW2ia7lzHpGRuU=
X-Gm-Gg: AYBFou28rtkdNBe5ouxTDbSTFlCws0iVkFJ14NConramslNd94kSzEITw219HSaKY/a
	oDuh2I8sqJGjQtVMgzD1puugXTdBpytJGIHIPgVLNdNuepLO0h4vwyVm1Gj/QRpcEtfJdaRRG3Y
	FdUio+NnrZbTlpV9KMXQRF1NbmPHzkYlyS7u9Xg/djCzL4vPPZdNu+5Ix4fH6V6kzYOpxgRhLrZ
	NU5qLrXGQovVNB8TGL3uFcMCFza34B9FZ5S5RxRbV/sXx6yTQTvEAzcXWm4e+E4fwpVIoRdhQTI
	ETlT7P2fd9TB1yXI/YDjNmdB+cokCDwWy4+svD7sgxWB3lKXjm4g3j8jF0UyhU1qFT1tBKA4p0b
	w8XVuuYXBeQTx1bQIH74X8JuYXO2SXNE28Q+JVZ/svyPD9J+kgN19D8xqj9r1ZVPNA457kTnuXg
	LeIwM5PTYtpyao2uaTLzlIhaK5iR6lapY6oFkcRnUE3YlOB/UYsHC0UR7DKl7Sab0pYEhWJP5nO
	/OoAuBUyY5Jb2ehGYJDeFLLPJAngkcJft7Lh9q/sG/7lKtX9cUwNixFIWdmOTfzh0LT2DE3AHP2
	bBA+yDK2PV5tHUh7XePFYff4XHcP7rg=
X-Received: by 2002:a05:6000:2c06:b0:48d:f36e:fbcb with SMTP id ffacd0b85a97d-499c5d46d91mr5111990f8f.14.1794411662491;
        Wed, 11 Nov 2026 07:41:02 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc9asm10823768f8f.29.2026.11.11.07.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:41:02 -0800 (PST)
Date: Wed, 11 Nov 2026 16:40:59 +0100
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev
Subject: Re: [PATCH v6 14/16] printk: Do not set Braille console as
 preferred_console
Message-ID: <avSMiz0n0aXLC65_@pathway.suse.cz>
References: <20261106171952.207909-1-pmladek@suse.com>
 <20261106171952.207909-15-pmladek@suse.com>
 <sashiko-outbox-201949@kernel.org>
 <avHm3aYaDdcif-ss@pathway.suse.cz>
 <avHpL7ojyapVvGlY@pathway.suse.cz>
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
In-Reply-To: <avHpL7ojyapVvGlY@pathway.suse.cz>

On Mon 2026-11-09 16:39:27, Petr Mladek wrote:
> On Mon 2026-11-09 16:29:42, Petr Mladek wrote:
> > On Fri 2026-11-06 17:36:30, sashiko-bot@kernel.org wrote:
> > I would fix this inconsistency by a separate patch:
> 
> Grr, I sent an older version of the patch. I later modified it to
> update the entry only when it was not set before. I wanted to
> send this version:
> 
> >From b4e425390a42bedb5cd19a8bc959b6d1c4a61d49 Mon Sep 17 00:00:00 2001
> From: Petr Mladek <pmladek@suse.com>
> Date: Mon, 9 Nov 2026 16:01:35 +0100
> Subject: [PATCH v2] printk: Update Braille options when preferred more times
> 
> The current behavior is not consistent when the same console driver
> is preferred several times as Braille or non-Braille console.
> 
> In particular, preferred_dev_console is not updated when @brl_options
> are passed. But @brl_options are stored only it is a new entry in
> preferred_consoles[].
> 
> It is even more hairy because preferred_console[] entry is considered
> a Braille entry only when .brl->options are defined.
> 
> Make the behavior consistent and always update pc->brl_options when
> @brl_options are passed and they were not defined yet.
> 
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index e248f2d0d01c..60423c765520 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2665,10 +2665,10 @@ static int add_or_update_preferred_console(unsigned int i,
>  	 * Historically, the preferred options are stored only by the first
>  	 * caller who prefers the particular console.
>  	 */
> -	if (is_new_entry) {
> +	if (is_new_entry)
>  		pc->options = options;
> -		braille_set_options(pc, brl_options);
> -	}
> +	else if (brl_options)
> +		braille_update_options(pc, brl_options);

JFYI, the "else" was wrong. It caused that the braille options
were not stored for new entries. It should be:

	if (is_new_entry)
		pc->options = options;

	if (brl_options)
		braille_update_options(pc, brl_options);

Best Regards,
Petr
