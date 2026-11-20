Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177929;
	b=o1IXr20yO+jGitPmgWuGLQF0ht2hq8vCBYfQAcxZGzf5AQK3J8NUPi0Jiwp2/AKk7fnD
	 avo8qVwcL/96cCDJimo6IbfrAYDCfaA1PjiMHPNnVnDam0uX5EzaAT51MlAm05P3wcI3B
	 kXrkqhK0vcEAPQlqlpVc3udRTMRLNZN+/Tn09Tobrynf6tnm4xKABIvhNviC4MuVHG91B
	 quXYBCJ+Pd2ZeGwX5zDQbXqEwHOCEKHhxhynfishastUjCy/iKidpmmCn7R3Z7PKazXRQ
	 H4qyVJEVTW3w6rMzh1rB1ThwMrePHnluFhIjQantX3LIzj6dwyqoLDAHUvSFKqAF+Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DHHoC2g4FGQOaFmO9WWGdPe07q737sEuTQ3ZoHdBQAU=;
	b=3EN1ntloAczuOdoVBeJEXZOhsnvovIl9LglbSg5hVnWht3Z4J2tkFqX2K5MFYFGrTUiR
	 O2M2/uQahyUwJTPWXVmf5vPwIyCM1zQNIKmT4euL1YsvQp0NMXGIceIn6EiYubVfNfl59
	 vZwjx8hoqG7egFYTmOLyhnHyz62KiW94GKgHgvXx6MK9ONOBYWs4uDpOtIFpLfobPGiL+
	 XFsoPIAmhM+Pos/jxm8XtLmxxiX5Z66m0TmgG7yOywGWspVXunHNjje2STOR3xLCK5gQR
	 MEq4hQgR/y9dGjDSYzkKnctHMauNA475M6iNz9MaX8akYUhl+H9K/4OB4gq9mtHLcKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VNkMDMdg;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE1D606A326
	for <printk@lists.linux.dev>; Fri, 20 Nov 2026 12:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EE1D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VNkMDMdg
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so7303195e9.1
        for <printk@lists.linux.dev>; Fri, 20 Nov 2026 04:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795177927; x=1795782727; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DHHoC2g4FGQOaFmO9WWGdPe07q737sEuTQ3ZoHdBQAU=;
        b=VNkMDMdgGBpLB9dm3y9D8Oe+UvO1fBinjGml+AnDBMafTz6UKShp8AHPg+ed3cgn+D
         /xVtp8buTqjsn+TQpljBVtB0KT+XRt0BSIC8gfGPqTb+ZhoBK0YXzUsfuDBuCwqvn6uE
         k6NxC7mSMokxCbeELjPm6+QC/xl87A4oPDrUAPdrlwcceWHszQQSouEpTDH6HTyzA0AZ
         XECyULZNhXBzUHOPCQcHKP0OJi0w5/3Fic/itJ5LPgfsBF5xeqJUjokwMz+pvYuYTYUz
         KUNc4d/R/ESgsdGSputu2Ckd5tiou6DTydPm8VbyUYoNF90eKDWzpYDYGB1x4R0QjLJa
         l1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795177927; x=1795782727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHHoC2g4FGQOaFmO9WWGdPe07q737sEuTQ3ZoHdBQAU=;
        b=ySZu6v3uhgMU5ezw+GS7vogBcb2QpF3lOuxhZwSC/n7xYKq6g79rBwTOgpqMO1APPp
         KCu6FVHfQg5PZ/ZGAquwaueeQFWDEh23jSBk5Rjfnd4Fvi9cv6wcM4ew+ZZ1Dbk1qasD
         nKMt+Tyf3lVCf9Xm503ddQXCBC03SCu5norh3qh+3yUVLWhprwl4WF1Y09Rdy6H4FU9N
         2UVuwn7CwapYIvQXJVFetpXsloJJMpeUAHmuc7y5WipseLs+oj1d62GHYDyg4kiJ7oiF
         UZeIgNeNW6UahiwDfsoTRaoHptunDQUw39WCFDNPK5rMw9F3IU/SsRpFs/1vA2trSs5c
         tJRA==
X-Forwarded-Encrypted: i=1; AL+hErGTUwilF3DOABRReTSISVnltDJK+6dvg588zOU8FRjAhmWGubXPrdvNcBR1Kj/O294sthNNP5w=@lists.linux.dev
X-Gm-Message-State: APuU4Z/HVMHhNu9jDbFo/8XgvsKdL4rNT+q7cin6vH+qE8eebGcSRx0L
	XUvKvem/MAB1kzzVNo8et6CWcwrrZZtHbLlrOKZjhm+MftjG161qWku7pcSSir+6VfU=
X-Gm-Gg: AYBFou0votuATfRjokupiKqqI+HQDdNfG4MExSAsLX3yUjnqLB3NCNMPxqMI2ljK8HQ
	+NWI9PAU8ym/c4bh7h8doQh2jEDnwywoVD9scNwIpF96/xLNu+5aekS9c7T4gTFSTtsHB64CMaY
	YL39iCDi7ltVPmOw7iIN+51BeetAGcdHz8AJFtbpTc8qx/v6balUIS/Bfl0zAJBeaKjXn7BxHPi
	GaU1MGN86l2XAJax3YlpuSK8kqwDF2K4cWYhl2ZXXft/wCUN2volSjZmsIyyXkeGzLBjRwi+QRy
	MWeO+TuofbtMYG2CL7o/x5nvWTxAcagPethehHNJ102FuSjwa5izCXnMCuZTpQN6T40kjmNG1oY
	RHB9Ag3rGrilUFTGfWTvFwvPG4arPZDzBBcTI7hP5IOBIFKAn+mGGvFuUhcae3il92jaernmuKU
	B9FyQQkokTgo76DDp+NjkC9mIrO6/5kIHEsMN8WGZ5W5m9N6s/KJ8WrgI8Wt0NCJ8H4U4+V6yHz
	oR2kh11ENspcOGwULFZAKEUInfSz7Q6nvyE5QHg9mIYU62UgNWLCdwnyvLe4afqDTUlLjoToiU3
	GnAnCBAncaoYzt4aY9nOGJwvmhQ3jscMekksp9Fimg==
X-Received: by 2002:a05:600d:600b:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4bb8882375cmr65235245e9.32.1795177927382;
        Fri, 20 Nov 2026 04:32:07 -0800 (PST)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm179842545e9.4.2026.11.20.04.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:32:06 -0800 (PST)
Date: Fri, 20 Nov 2026 13:32:02 +0100
From: Petr Mladek <pmladek@suse.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: john.ogness@linutronix.de, rostedt@goodmis.org,
	senozhatsky@chromium.org, paulmck@kernel.org,
	printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] printk: ringbuffer: Annotate speculative record reads
Message-ID: <awA9wqUfXuX92d4k@pathway>
References: <20261113075039.172176-1-zhujun2@cmss.chinamobile.com>
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
In-Reply-To: <20261113075039.172176-1-zhujun2@cmss.chinamobile.com>

On Fri 2026-11-13 15:50:38, Zhu Jun wrote:
> Readers may copy a finalized record while a writer recycles its storage.
> prb_read() checks the descriptor again after copying and rejects records
> that have changed, but the plain metadata and text accesses still trigger
> KCSAN reports.
> 
> Annotate the speculative copies, line counting and length read with
> data_race(). The descriptor validation continues to determine whether
> the copied record can be used.
> 
> Fixes: b6cf8b3f3312 ("printk: add lockless ringbuffer")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Looks good:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
