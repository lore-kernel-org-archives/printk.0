Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795794284;
	b=pbTxFEgJ0F3nz2SEKSWW/YRTX/4TJVgh4U3lZcoxKT4me99I1UlUFklFSURN3WpflmuY
	 AYW6GGkbleoY2nmf85oubPxsSrcQKbgSxWfpVGWiO7y+kyfPYASM5rKOQyDq5RALZEhcH
	 grn8ZK2oXBznD0QhoqSGErJclsXYxBl3H7pv/gtzka1p4d2MX4Z5g5nq5rNmqzPNUV3yV
	 I/rmisADYAyAaOmpzoSrbhgLC3GKN/njFeyCUll7cPlxhTlFPJoX2oJwnBxQSymhuowMX
	 ba92ZLjokcoG0jy4EMXU6/nLjkeIA7eyYXEZFiEv8raVk26jiQaSp/MX2TvMrXsphJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=20hIHl3RLMaTBqS+Fk6fMIAVdz1sONBQQ/8y3gKeNGo=;
	b=x9JPkTVo+d+OCAQPuzFfEFO+/imdTLFlRXdjRw0DBcFvi58SXUXvmxp7T2EfDfx5d8Jv
	 dfi+eNxzoGuZld1fdS4b6DsrwVJ+OIIk0TdD9mCAD0LjyzZa7AXjSP1dqXMOsaJDvJP4g
	 fpAHbeVa/1FuRM8XwSbQgRmM9kV5ss6AdNizswo/uvnr/SYUJ4DU10hBOVXDePzOBhNlM
	 wT8eTgtsEKLVyC4PVLGQIeToiDJ8lC0ZuLbUBpiTl8g9qDQu/SuYd+D3ubrengb6+I+nN
	 FXgSO1RYaUd5mCR3Ou639pb3RJmwjZcWn3+I27EYNRh3W/QoOguo9LT2t7+73kreB8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mKJPkaAM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5F3606A33A
	for <printk@lists.linux.dev>; Fri, 27 Nov 2026 15:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F5F3606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mKJPkaAM
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b4d6981c67so53549107b3.1
        for <printk@lists.linux.dev>; Fri, 27 Nov 2026 07:44:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795794283; cv=none;
        d=google.com; s=arc-20260327;
        b=fhl53KcLhXh9dB4EAZcOVedCndc2Q/k/YvCc2RrxThB09hl6H8tCdFGzgvkZyQZEI1
         FnizqdhVWE2Q7K23LyRQasbm4CdUT+q1zhZTsqFUQsBAoZ1VV6ZgR61NlNRwHXaiekZV
         BGBWhgVlPpBSBWy1JXcBS4aVA+e7+CSBix0IRGdsYD/KrBDPMFIdUlM5UggsVZoODdL7
         j+w66RTOOUSzutkpUVHnD2+8d5EZh0oVhF9IPG+2onRF1LlJ+5ob8IVmPTmxxatvxS79
         cQTzcPQfdjNyGCRUnwYEG3ksssqWXhKTN7Mq5lCP2IYlzhUJVsIkPH6nwd8oFwEXGfkN
         Dw2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=20hIHl3RLMaTBqS+Fk6fMIAVdz1sONBQQ/8y3gKeNGo=;
        fh=XKwE5kQZ9BNMgFiSHjc8wMyMgTXvJsOCuEmZWd8391E=;
        b=B12R0LyCGl4cDrEmmoZHJMQYfW6X1mDZuoobVj/H6rnSHtkNly3xJai9QdtgNosZcf
         bGZWaScQSTKrtaDck0/x/JMLLy4x10SDrTtZbiwvLTQkkeXiASJ+O5zh9fKuAsVNGTPc
         vwv4kL337CAIu0652y4piwFEoW7zu60IOmMo8kRO5HnDpd9JOCGIqNxHqHCcXyo8Boxp
         P/m4mMZtIXKV5T4/YqBFsqG1n6c17pBDqgsG69UTqnxf76TXA/GiG1lkITbom8GKWHrK
         9sferb3TCSPEWcGOSUTHTbPIf0RiaOITnJqm7KFMj7RgjWGvUcfLl2mTOHBXF84m13Ml
         uBXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795794283; x=1796399083; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=20hIHl3RLMaTBqS+Fk6fMIAVdz1sONBQQ/8y3gKeNGo=;
        b=mKJPkaAMSl7edwSNJD0RiaOKUwrp7BKHnt55JC7S5k2MUGVuNo61h56k7XGixqjwSk
         a0Fg9C0RRZk1TapI8Y2zt1SMpXYaMYFgEtmARti+iuKlLS2vl/ZS3Vcm4tR8i5dAtzE0
         PvT661iByU/SPbaUpN9Dm1OFSMG0wVQYYCh1xXM//nGhh3g3j+byMbeBUY2LPn03Szgi
         9Wjrwqc6DK9otwr+I/7ia3NfG40bviSNO73z4ZoBZ4nAVHhPxk9xUHwg1c7bRddCZMCe
         sWwuUX2AfPO5wYJrgukD7XEnXmsZc9beqEhOCJnNZqpXZrmEpTJZDXcbhleD7T8093JP
         Imtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794283; x=1796399083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20hIHl3RLMaTBqS+Fk6fMIAVdz1sONBQQ/8y3gKeNGo=;
        b=rL9cIOQBf5bRfZfS4/stX3jmL3pG4BB+qIN2e+T/hC8pCWx52Aplyy3oRG3QFDJ63U
         IbmHJ99B6qtU/8RjBEw2Hq1tEOOCd2fU1UTSGxeRqQjqdiT4aGhX/tFQYD0/vzBXyB6j
         vaSv7Fhu3Sc8YQ+0N4HLeEeXPMSurE7zzS3llhTxtPbBFQaW6/DIXb2jXam/Ycq7cwej
         IyIdZZFOgriHpEe7olq6+zXzJLWKfRD0VazFgrPl7y3UD+PdykUXhPPANKKfGa7u/SDP
         bR+7n7wrVymS7aYxkvGIMn0WpFi5CTddke5vhRrF9ovAndRXEAXrhb3PwoX4yy+kN96J
         tw4g==
X-Forwarded-Encrypted: i=1; AL+hErGGRBOTWyA03jVhhHMZMfZPSeYBLwjkHzExcjwXlKQwj77Oxqv5IOzZUKl2iRncmsI7YQ5yVHg=@lists.linux.dev
X-Gm-Message-State: APuU4Z/A8e0eDVX8Vf3bxA8yCdWFSMiDodFTuFYG8AnT3aqzwmgE4ZJi
	qNBwGLFgDepvSYdaar9Yxr5rWjtZa6IYx7l+JKsJbMcxZgiaE+IavVu3jFlkPF6Xq5OCbaizX6B
	T8ibbY3w4XuGrsmxefofACUMztrCRNNE=
X-Gm-Gg: AZFdTZckNjVq47RVwksph43X5lZVyTUTFyX8bmk7G9Z5fk1Ce0XNo9pN/tuBbYxc10l
	Kadv9vTJ62tapXgzsHbdtdHr7dfIWih6tp3oMXa7kJzfxkEtTuLRfI9R4S/FjYIFgw7PZnt0JpE
	Ij2Oxi3DRglTMtc1yAOs/hdSJ9P1kXXzCw75GFCPvly9wToFsu9Yy2kzQS7K7uSndM7NsMcS1bb
	SS/FKNkdRkqA2r4Ob1gyeuWmGPanFsqEQCHzLUKzMRuRecCf/jKAav5gQLv5hup6OsxkRkY45iS
	6mLRICh8oPqOZJw8Vy846prnDYIRUvRQqeN9emQVdCj5c8tO8kY22Mdkp3Vl9sFX6vfhID3hixQ
	OiUtXpuYvYJG9oS0mJjr6M8ooNNGUSq70ddr2y4/Bsiu6GDZPxFvmGgPNo0Maf/MEvE2tlthKmM
	lDLTywwSOOetJeL9LvDBCF25uioJKS0Im7CO7sig==
X-Received: by 2002:a05:690c:7203:b0:8b3:5b88:a1ff with SMTP id
 00721157ae682-8b520510d51mr105499077b3.64.1795794282949; Fri, 27 Nov 2026
 07:44:42 -0800 (PST)
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125-pr-fmt-v1-1-3ff6832f5a50@gmail.com> <awhJooa6HkPoKqSH@pathway.suse.cz>
In-Reply-To: <awhJooa6HkPoKqSH@pathway.suse.cz>
From: jim.cromie@gmail.com
Date: Fri, 27 Nov 2026 08:44:16 -0700
X-Gm-Features: Aa3M54o2jG_Z3yd1uKXpyB79RBB4We_Eb9nyFArcsaHU2GACLzlfr6Wqn0l7ldU
Message-ID: <CAJfuBxz3epK54DzVNztCzA=x=p=MPM8JbHkssdNjj4-qBHDtqw@mail.gmail.com>
Subject: Re: [PATCH] printk.h: fix overzealous pr_fmt in pr_debug_ratelimited
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Jason Baron <jbaron@akamai.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, printk@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Philipp Hahn <phahn-oss@avm.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 8:00=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Wed 2026-11-25 11:12:53, Jim Cromie via B4 Relay wrote:
> > From: Jim Cromie <jim.cromie@gmail.com>
> >
> > Historically, the CONFIG_DYNAMIC_DEBUG implementation of
> > pr_debug_ratelimited() passed raw fmt to both metadata and runtime:
> >
> >   DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);
> >   if (unlikely(...) && __ratelimit(&_rs))
> >      __dynamic_pr_debug(&descriptor, fmt, ##__VA_ARGS__);
> >
> > While descriptor metadata was clean, emitted dmesg records lacked the
> > pr_fmt prefix present in the !CONFIG_DYNAMIC_DEBUG fallbacks.
> >

,,,
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>
> Looks reasonable to me:
>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
>
> Jim, should I take it via printk tree? Or would it be better to take
> it via another three to avoid conflicts, please?
>
> Best Regards,
> Petr
>

thanks Petr, (and John)

Ideally, AKPM will pick it into nonmm-unstable -
thats the most likely path for my dd-classmaps-fixes series (cooking now)
which verifies the test-module output, which this patch alters.
