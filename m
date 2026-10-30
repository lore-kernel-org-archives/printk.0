Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378517;
	b=WdI0vGxs/WRKB1wZjrgdDYIkmwp5fYp/Bw4KgdrzWB40izc8QplcMfQ7QiRwAys0JVfD
	 dJ1WmvYOltSQ7azuoHglfGyfSrBI7QSYZ6uUscYSTLlQow10XQxoVP+6ge2fTWRiHfSaF
	 Km+wFWO2Khkm/K/CtQAjTgdXzFzjwsl6pV8evd86wIUM9vT+LsE2a9SvLVEIykGRAIm/S
	 6sikEU1p+qqd/iefpSwTAelWN1v/kbyyy0KKmM+qMvz9obauVlhV7xl5JQk7s5+P6Ml/4
	 8ukgywUrjdn19mEOCPJ3KYvrjbMwxo33u1zT4z10i+B9jmvGercu7vEa9VnbuDkOBMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AKRiR21tiEzQNQfnibDihocnDjftGBvWd8nI+L+S9UI=;
	b=Z8cd2jAQIu896WJ62NxYSSv34nnGEFnssYk3g5n/P/DBaRtpxDwXIUt2YNxGYT6b0Y+J
	 VnMHSUscOi/wCgU21wJIBZHVkJG2dRdAp8bsVOovkqfIehNo5M5FhHuyTnyk7UUtaSYtd
	 XmJqIlSpd324hUb90IYry4AxKi2rTbAlnDOoXebkgGSwvpj57oARjPf3JEZ9WyUOgbFdS
	 RDIqvzVIBw/cr5VOZgHIehCexXioAD3XmeB8VRTGwy5chsNPCRTrxL88xlNqxotAZPlJ5
	 PIiicTb29N4gfseSn4CkFENZ+64cysY3EYZkqHjRDxaPFzSc+KDZezlQ2yejnCDjOjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EAjRhbto;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53DD606A31C
	for <printk@lists.linux.dev>; Fri, 30 Oct 2026 16:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C53DD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EAjRhbto
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so8573975e9.0
        for <printk@lists.linux.dev>; Fri, 30 Oct 2026 09:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793378515; x=1793983315; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AKRiR21tiEzQNQfnibDihocnDjftGBvWd8nI+L+S9UI=;
        b=EAjRhbto2BWgHvGqKExEklsDat9N/Yi0F9y1QJmYr3ARjH2Ce6/qNJ8wwrQfLyLvnA
         WSdHSmNp8Em4f/ufxdCtLJrVuiLct2eosuPVc6WHHb0sHdm27UhkQUHxHF2DuPThS437
         y3bqohyKupXffBCG1Jmzwzte9AjE/D3DGGf1f8ZzWsxrukLu4w/XP93o1cldeVZj0p24
         Oq4h4wqt8Szn+jd8sNgF2m7RyFe+ConSUWq5uK698kzFV60VRogPhb4vNVWqOEe45NKD
         smSxnkDkmf5vzCZuwURRxZW0tXUTo67mwjnZl8T2jCEXsXXC744jVbgUMpND1bAzPHsi
         DmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378515; x=1793983315;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKRiR21tiEzQNQfnibDihocnDjftGBvWd8nI+L+S9UI=;
        b=IDjen4z3nGJxRwkyXbxAIsZ/nEQUl0adI+QR8KOk0twrXNf5e4mzxUMapJeIx7Mp9K
         xKfaBFXWNvuD6nC0oyEJtbUcajtVdoKImeCxWLC5V/KPhqlmyuCjJkO+6aECj9RhAYrr
         pikz/T0DYNbWBxDQHW9f/mokSGk6HjQlUlLPdyO/dzxEdVg8lMWxhIhr8Um+0OV+kM5O
         5TsCbGcvVLhOkJ5/8W4VJ5GMyky0ZhyIjM/v39M0qg3OjGVYvJJPUOoDiemyaDLz6QR4
         KtrRk/OMO/tixsYZ6LObgsc+1jf7hnvL5qvNGHFoAwvxKpFFwS7CKmsuijeizAcv926S
         hU4A==
X-Forwarded-Encrypted: i=1; AKwUvByH6LWafa+4hDjug/Ew3U2k0Al6YHR5VEPeL1+rgDOJ1/gZ/qggxBkaZVpDNRBB80EpL4BSBsQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYJYLCFEOBeymZcrRTnERw75LT+BSuQ3wKNNnBObIYlt8owcYLkH
	lEYr6EnjIlK7p+1W/p+tCkJxqotCRbAEaLa6UaYI6ZkjBlOJKv3sC0GFwYPbEIeDLbA=
X-Gm-Gg: AYBFou3ypegZj6QCgqH6miavOhz7gZUP5ImAXThRIlXRoZqZgMo8R3nIAVcZJmWmEfA
	P2vZ2dFZErLRNNyLUUxZyYEx9e7ktymnqSLgswJTBied5/IQWYccUQraBnnYd6sG2UpyfHNpXzx
	oroG+nNiPz9VOBLq4Xo1jjbmn1g6FBvmjwH1GMotnxoks2FctcsX666HBcA0NKXJcmm47Fp/adi
	S4KhLKjOBe00hcDwPhgs62QVwYBVpe45S+uUABMLG/aYTKL+QyICMY82pmLgR2+toxY58LkIldi
	NQ072DbxYrjbLRpD7mvgj5KOGSlU7Ny3UxEgg/kYDtmLRWj438TsKLHgU7Awm3a3daRJlhfDYMF
	9tZfIKu+7rd/E+dKxslVbXN/NYKn1VYg/d+u9PqdwPiDcB+ileED4sGl1UqhpZOnmQMjPfucV+e
	mVhIfzQ94DuDPUsVSaXOU/95l3+Fp+ZXo3S7H8UnPJlFYXEDnJqc14KAWLxKPUl+Xo297Hnv9X9
	lAtUesL2eFZKa5P8PjAmQSN8vSkkywo+3SHdNXzZDJ6Yirgn3baL2fNQbuxaQ3RhQHVHg0QyIQS
	sOTSwXLNRhWdfPC+w3mTihbg2YMfoExkTd8XOVWn/A==
X-Received: by 2002:a05:600c:5397:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4ac16acfceamr63192545e9.9.1793378515124;
        Fri, 30 Oct 2026 09:41:55 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm165061125e9.11.2026.10.30.09.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:41:54 -0700 (PDT)
Date: Fri, 30 Oct 2026 17:41:52 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Derek Barbosa <debarbos@redhat.com>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH printk v2] printk: Avoid multiple unregistration in
 unregister_console_locked()
Message-ID: <auTI0Dv01budMJv0@pathway>
References: <20261030135802.663893-1-john.ogness@linutronix.de>
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
In-Reply-To: <20261030135802.663893-1-john.ogness@linutronix.de>

On Fri 2026-10-30 15:03:55, John Ogness wrote:
> unregister_console_locked() is called from within
> hlist_for_each_entry_safe(console_list) loops. This would be safe if
> unregister_console_locked() only unregistered the specified console. After
> all, that is what the _safe variant is for.
> 
> However, unregister_console_locked() calls printk_kthreads_check_locked(),
> which can unregister _multiple_ consoles if kthreads fail to start. This
> could lead to hlist_for_each_entry_safe() use-after-free scenarios because
> not only was the list entry removed, but possibly the following entry as
> well (the @n temporary storage of the next entry).
> 
> Move the call to printk_kthreads_check_locked() outside of
> unregister_console_locked(). Add comments to both functions to clarify
> if they are safe to be used in hlist_for_each_entry_safe(console_list)
> loops.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/lkml/87ik31iz4x.fsf@jogness.linutronix.de
> Fixes: 76f258bf3f2a ("printk: nbcon: Introduce printer kthreads")
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Now, I am not sure whether to queue this for 7.4-rc2 or 7.5.
One one hand, it is a potential use-after free. On the other hand,
it is rather a corner case which is hard to hit. And it would likely
happen during boot where it is not that dangerous.

Well, I am rather confident with the fix now. So I personally
prefer 7.4-rc2 to be on the safe side sooner. And there are
already two more changes in the queue for 7.4-rc2 anyway.

Best Regards,
Petr
