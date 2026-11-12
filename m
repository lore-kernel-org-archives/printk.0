Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524676;
	b=4TcI7YHz6rkDNnA3mp8zu9BghUY2d40m+YYux09iA43Vasob2hhyVSwJ7PJQQSteoaS1
	 xgNXTv/YwGuIPWR07XrFa2vjINirMz3bU7OUjHkRpOSue23tdw3qtF95ZMh1L0g/cnEvO
	 WgYzE0kLm+tLNWuqNI7WeB4Rg2MSbueqxq1UCrP62OvxV86PdNGyCGw1OhVxFwQvbtssA
	 o+zn3uGtVWZLnrSOfCTK6KEKUFnpqbqdUojZTxB1CumQPeGRGpw5myCbp4UcX/K1k2mIY
	 zsUuRLdamRuobwDecaSMnwcDnKodXkP0uHQ7RxTyqMGK0X3Mk/UtYqM9tQUPrvbd8UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=sBij7smZOouUHznKTorIJM3XynGFmmLDsT0WPy2roWk=;
	b=SxapMOyHjj5TFVr4ZJPYD0ZIjr1syN1/nAdznkVwx88C4oeT4s0Dr0YoHV/hASG6C/7F
	 LK1M/L4AWUilmMJ/Eo2FW/9rdqlNHtBhU1jSkUGchhNeQqP+2TVUP0Xh727gLaQ8UQDhm
	 /NTaXuB4wqjOmGwC/MW0p4WxUxhjvPnC6hRYygXhwtW+uttyhO1S9BGIa6xyZ8ltGWE6Q
	 ViKCaABRG4e0vnj45eqdu+TvHCtIvNM1c3rHoteTxK936g7zTBBr8jXxRM3HrZBhvRqqV
	 uYSTnfz9S3wii+72vXjirilHDtAR4NuSQYFlkKD2CufwR2Fq9Tz4iqPpKXKsbdXqSbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=bus72Gkx;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47135606A338
	for <printk@lists.linux.dev>; Thu, 12 Nov 2026 23:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47135606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=bus72Gkx
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490a0e72588so96186f8f.3
        for <printk@lists.linux.dev>; Thu, 12 Nov 2026 15:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794524675; x=1795129475; darn=lists.linux.dev;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sBij7smZOouUHznKTorIJM3XynGFmmLDsT0WPy2roWk=;
        b=bus72GkxwEoZI1lEM3RpDKXSSwID2irKh8orGBx17sqO5M4UIrAm61/kafEuUvvvks
         OcGX4w1Z7SKX73RsyiyA5KFytAYQXYjp8zPVcqvlb1LjeG+jHk3hLq43c3VjUZak/grH
         p13Om1j/IipXx71glk3k0A4fmHUGB5mDbP25E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524675; x=1795129475;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBij7smZOouUHznKTorIJM3XynGFmmLDsT0WPy2roWk=;
        b=jKpl+teD/sxBU15Yg6DymqFByUCnsoxETsU/Z5H4m7K4cc/SJ/5nAGvbul/MZF1byw
         jN8dgz9VHia0M6P6tgq4Pzexik8io+tsN+t7tWicB1fSalZ0pyBzYeBFoPtzDw1Ydrh5
         MxB2yf1QDEaw1xrAtzl++I+1CoBSCsFWIbemAF9goRTxMVQWCylBpIw50XL1ZFqmP6fF
         hS3AxoEWtMaLq4awFQ8scfQ+NgORrWh+S3DbPHiIybUWs15b/IrIJYU+dvhzOIZqEjRS
         xE2ZwxqZ3vPFdmZTER6nunPM4Yq96WrrdyaJzhaDL1xUCpA9AjWZTRt/nU/1CAxjJQhR
         zUkw==
X-Forwarded-Encrypted: i=1; AL+hErHttMW51+B/Z9geDCNszr1ODRdpyADSlBz4ItCrXL+UJkI6PsN4K4RQruGXOWxevZO4xAeWIM8=@lists.linux.dev
X-Gm-Message-State: APuU4Z+FsTUy/+fIzkb6kmoIx4jYoTqyDWehZOMZU8NsVFbwnJOoB87w
	KfqrgEfvwqkrBclK6YFQJ/k14hLUHxJX54XoVT7EThrKRAxyxdc4Om/mbUvNbC4QChk=
X-Gm-Gg: AYBFou0Ky+kyi6MrGmqewDIm0e8vrIW73PPHS8dRWehv2TwILIewyQqkEjGQkJU9Lpf
	Fva++U3PfL9pKscU9XW6838cpqtVBXQRm06RRA49PpL4HIjUP0Oz1V7NG0wGCBm3SFOpcoN7s48
	WCkfq1t/n7Ww6FeAHprXJJK2yKQzytSKhX14mnDZIdRNAxOZTRwShbXcR8fK4ZjzklTpN2RlmwB
	4DZ2LN7NOswWvJgdkmfgxoeLJNky/E7PUpVTICJl4OXorJKeVaPIj4AXlXUsGeM845/6LDzmRxJ
	FBSWVYPKdIFBGMs4hfX0qYqHucNap3CutCZufoBhrHc8SXOjE+5IK+v+iyJNkMeiUECcT55njaS
	Y9qvr6TkWVQOsyK1lHHJ7x1A05erqRGzIbk7Fk6FaDdWgze6FzmqJhkPAwgdmNvs9cmvm40foSr
	pi8rMOUZHLXog0LbDPwD09NhHVY4/lJ2JrrB9/YXHsJtlX+j0oLIEtewMejZXP2X2W1fMaajJvk
	bKS4b+H7zVfaLRATtWg099ZB1RfsWMmhjb/sYcVgWWmydnayWNaKQrcDZaW40OzgYvuNa791NJh
	W+YmCgevKhcU4Yxw/v4QZNjepwEqNVqLpDnZMwvN1LnzDqbBYoGHEHGGDjZaNIF2DNtBMRjixN4
	l16BK5Hl3Hlf7w9JP6QIppfGPmDuBhM/zk+TmkPsZYaptGrx+BLymb6qliRK8YP5oqoCVP63S95
	klVnJunZfW4rzBE5m/xKdfJpbNFNo4Yt+NA9eG0pbdOgWAF+Scc/U/lIe1ig==
X-Received: by 2002:a5d:588b:0:b0:48e:202:6718 with SMTP id ffacd0b85a97d-49c71b5d3cemr1948117f8f.25.1794524674865;
        Thu, 12 Nov 2026 15:04:34 -0800 (PST)
Received: from [172.18.0.2] ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm2213288f8f.44.2026.11.12.15.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:04:34 -0800 (PST)
Date: Thu, 12 Nov 2026 15:04:28 -0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Naveen Kumar Chaudhary <naveen.osdev@gmail.com>, printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 05/17] printk: Do not accept an empty name or devname as a preferred console
In-Reply-To: <20261111154816.71103-6-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com> <20261111154816.71103-6-pmladek@suse.com>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261112150428.860b24f1e2f53848@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Petr,

Thanks for splitting this out! I've tested that this works well.

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Chris
