Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233323;
	b=dccuxbdAKah8Dokd6ypzrzesHZVZ02bkkx/6HztOvteddP6VPRDIcAcnBKoBrpNS87gW
	 0PIDzdzhpWg+4qpUNGT480CZZrg5UyvIgnKCPr3TCMUrenRIsa1nBMzdREP2Y0GnAxpbt
	 K5TTh2BJOJtrlVVCHPqFBD52v2+L/obzGTvHHaHf/4amamLLtRb/LH9m+J8UXja0lHsWz
	 h5A8A52LqZvtwgszuOSNm3B0IyiAIROoDhb23WdSvQjsIKDWklrsL1A4mGP7qAOoJ+YvC
	 5kkWYnHwRpPXCuqfoS9E4VqY8KrW5MmdZTdswze0152A1lxeSdu8+wXPnZ45cAY4O4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233323;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=77wurJ380Rkm/Xg0cbFevd9UlQFlV56auT57Zyq+9W8=;
	b=ty/sup1KBan48ICx6Dh03E7jRYp6Ty+vOLTnwbCRdY5YiIbavxbvXPY1HvQHrdfb+alf
	 QDCRO8nTrrXwI6m5bF7IfCmjD1/LEDtAgmV1cDEYg0ktCvFJ8+UUm9oV8ntToctqMPQjC
	 wfKgiorOVyTfq6gxt29IZRctR7X2i5ajyE+n4LP68SX4HhpT2qMQpHircxGb0O8YG1l4p
	 MlcP5se/dyQOWRPSOjBmjaTPx6cPo8liBzAOpnjf6+kEcdP5YZHZgXry2YLyvHBwflLXk
	 13UOTYDUSjba9p/msong6MwSqJR6mlkC6NHO5Eln5lNvFOeci8JRR1GkGWcZwnIlp8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=debian.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B268606EE98
	for <printk@lists.linux.dev>; Mon,  9 Nov 2026 14:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B268606EE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b335eeb340so6252287b3.0
        for <printk@lists.linux.dev>; Mon, 09 Nov 2026 06:08:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233322; x=1794838122;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77wurJ380Rkm/Xg0cbFevd9UlQFlV56auT57Zyq+9W8=;
        b=oB6R4nEnu7AYkIiQygcxh3nXzdCamEz1b6kznHqtWE61psDK1W8nsDquTu27ecw+ZU
         lD6+zwnFLHZrI1PB53hkmo8jjigdINko/wWoFhKY1FE7yrX3J+9b0F4ZYozAEQB1zFPV
         yoJFaR/FA0E/1apUVukXU4pweP/fTSTenGu1gqiEl1nzxfMWmC7QajvHl2nbcvSbXe4A
         lBV4+4pvRYPggQB7Vzoowli7vR/SVZ999izTCdqVYi7qqLq8bHCGQikjhn7G+DBweqff
         YfJyhHjHe7t3NjfzBK23t1SHFZ9yDR45Dk0JoCzxKp4NjNgE7SF1d65XARdEkTZrn3le
         HkVQ==
X-Forwarded-Encrypted: i=1; AL+hErFHiwq1Q2xrLx+3BGLLnXScgli1uEwmQ0e6N6TIJV/7UQQse1I4/sa/sP7rd6ARCaQOuTyZ5sA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/qlYqq0MqGF92DN25sPDRDpGmIeRf/t43BcSQhDNod/7GDLzTj
	+86Cv2rqalOXCtuSnKmYTMNjYSSNjXIH3e0O/OWbx4x0afLWcHGIyoZY
X-Gm-Gg: AYBFou3j9FK6Xi1AelosauhQIhtu46/+lPBPDcP6pzgBG++0Yz0k7/7xkht7H92Vt4B
	1h+Qh4QgkXtY3Pjh7KuCo/jvZmVYx1vvDJpWHO17yk5cqDr0EHZfCn+lV6wk/vaK5X/G+4tcXQZ
	3KKwu1PruYNIOBfUhscRAxmh+hr+maGbPs0rZuUgDQaXRwHSg9PZqo12eVLy5KljgEPtpkinN74
	z4OvjglMh8V3gOVpS9u2ajUHoNTb5CesMEc9X6+00y8nPUbY5/+TVW2J5TA5txYd2z1zF6cVXeK
	qMArxZk9sNXsMVQATJQqGcJ5rfp3Aqr4bglNDwzRKHGBdxcWWrRakkYdihqwQj8/uOY6N35wQDu
	YHal4HDgGLy/P2xmLrwmfnebLCkIqHnsNqlnWalTJE1o5k3932SzAwIOH2ZqocB0dp/my0TXmt1
	fOL1xnj2Wl/xtvLyE3Q7/+bC0Bo8I3gFOifLodYY7mdImaBTC2NMQVIB+xrX6A0xdT+WtWzBH/o
	O25ekjdicMjmGV5ZgTX8J3zVmL10d9O7QSnJFr8Pkj8Kpt6jZqMgvK0D2HHVbncjdpRq7ycj8Qr
	ktQt8l7VivNiFo8=
X-Received: by 2002:a05:690c:b1e:b0:8b3:50e3:ec53 with SMTP id 00721157ae682-8b36ca2e629mr21721647b3.54.1794233322300;
        Mon, 09 Nov 2026 06:08:42 -0800 (PST)
Received: from gmail.com ([2a03:2880:24ff::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36b6320a5sm35777587b3.5.2026.11.09.06.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:08:41 -0800 (PST)
Date: Mon, 9 Nov 2026 06:08:40 -0800
From: Breno Leitao <leitao@debian.org>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, printk@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk 3/6] printk: Evaluate flush policy in
 nbcon_allow_unsafe_takeover()
Message-ID: <avHTDeox8nDGLC6Q@gmail.com>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
 <20261109123127.489676-4-john.ogness@linutronix.de>
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
In-Reply-To: <20261109123127.489676-4-john.ogness@linutronix.de>

On Mon, Nov 09, 2026 at 01:37:20PM +0106, John Ogness wrote:
> @@ -1572,7 +1608,12 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, enum pr_flush_r
>  	ctxt->console			= con;
>  	ctxt->spinwait_max_us		= 2000;
>  	ctxt->prio			= nbcon_get_default_prio();
> -	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover();
> +	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover(con, reason);


Thanks for the series, I've tried it here, and I got:

  sysrq: Resetting
    ------------[ cut here ]------------
    WARNING: kernel/printk/nbcon.c:561 at nbcon_context_try_acquire+0x72c/0x790, CPU#0: sh/212
    Modules linked in: nbcon_hold(OE+)
    CPU: 0 UID: 0 PID: 212 Comm: sh Tainted: G           OE       7.4.0-rc1-next-20261105upstream-00006-g4170adac69fb #1 PREEMPT(full)
    Hardware name: linux,dummy-virt (DT)
    pc : nbcon_context_try_acquire+0x72c/0x790
    lr : nbcon_context_try_acquire+0x508/0x790
    ...
    Call trace:
     nbcon_context_try_acquire+0x72c/0x790 (P)
     __nbcon_atomic_flush_pending_con+0x1c0/0x358
     nbcon_atomic_flush_pending+0x224/0x390
     printk_trigger_flush+0x50/0x1c8
     emergency_restart+0x54/0x98
     sysrq_handle_reboot+0x5c/0x88
     __handle_sysrq+0x298/0x3c0
     write_sysrq_trigger+0x178/0x1d0
     proc_reg_write+0x148/0x270
     vfs_write+0x1d4/0x7c8
     ksys_write+0xbc/0x168
     __arm64_sys_write+0x88/0xa8
     invoke_syscall+0x74/0x188
     do_el0_svc+0x108/0x190
     el0_svc+0x60/0x1d8
     el0t_64_sync_handler+0x68/0xe0
     el0t_64_sync+0x198/0x1a0

That is coming from:

   550 static int nbcon_context_try_acquire_hostile(struct nbcon_context *ctxt,
   551                                              struct nbcon_state *cur)
   552 {
   553         unsigned int cpu = smp_processor_id();
   554         struct console *con = ctxt->console;
   555         struct nbcon_state new;
   556
   557         if (!ctxt->allow_unsafe_takeover)
   558                 return -EPERM;
   559
   560         /* Ensure caller is allowed to perform unsafe hostile takeovers. */
   561         if (WARN_ON_ONCE(ctxt->prio != NBCON_PRIO_PANIC))
   562                 return -EPERM;

Thanks,
--breno
