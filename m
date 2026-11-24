Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516085;
	b=PNxgI8XO/RR6WPcV1BChsTGF1UeWj9lmyH8JLxUHhNrt1QlCJNqHCTryvdxmeyQqT4lx
	 TIegJgg5o2E8ryc7Kdn6n1l8nNSzUfSAUh0CnmkeOEeKBSaukWJgSNwOMW1lkdPun+aLn
	 l5kLJ+QPNBstKyA8AloUV0AUNhsyn0lZI81chf0QemfLZoZx6dPD+sRF6stgis6GLp9dM
	 8ZrWIj197RATiQUSGjw/I4Yyb4u+6QTBLCrNwqXeOXS8woVzfMM6JznBbYWgaiof22XjR
	 4bzTkwXwAgrKS90SsvdWUCC78r01uRzUpHa99tgsEd6xayp3pLEKl3C0OydajHDeY+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ihHHp6CHAYuyA3mpHXEe6HKUU0f2ZnmE4/lD0pXu6/o=;
	b=o2Q6CmX8uPX7QoyOc/WGgBImZJGlV5eDpqzZp0Id8GUm3bTQ0S+dNr4THhTi2roJ8ih5
	 0TF63i9WN7I07R04nsmBopF0/GerieQJaY61gIYM3seo5LEu7ttrfYKlOnxqXCgedFEF2
	 sWdfjMu7ByP/ofw5dAtZFLdLbXCTQvYf+pHyFpL6jbmy3PPu+QDFLzvEE3aSkXV6NwWLx
	 xs65BRPgXm7Z6sq5oXSLVOWo4vpJ7b4YODFJHwooZOpc2wWHW6TOOgPDdQ+eDJkr5eV+L
	 GzYahhmYTb2eA1JXpmhG0s3HCiPZpNOwoTUTIFFz8EUaGZeZmQgH9XRGG+8XL1aI9AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="ZmlOEuz/";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADBC606A33F
	for <printk@lists.linux.dev>; Tue, 24 Nov 2026 10:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ADBC606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZmlOEuz/
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-491846221ffso3663062f8f.3
        for <printk@lists.linux.dev>; Tue, 24 Nov 2026 02:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795516083; x=1796120883; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ihHHp6CHAYuyA3mpHXEe6HKUU0f2ZnmE4/lD0pXu6/o=;
        b=ZmlOEuz/fNdBXr7fkXPV9EsgL9+TBuBH4GqYbtnpq7c57FR3Ej6pPn1tnm8wvPbpM0
         grq+n8A8r/qqHlR0/6i0K/RPtHTx8RBh+OVGSIUmNOUBY6e3Uh71PGsPTzuQfq1VqgF2
         bExdsbSPJ19/rnx14XsZFABRO0Y+bkMGiuWM5Tdw1KH+RzV4Fa1u95+EJrumwAWxMqM6
         grRWpUYsPr804eZQ65qTZE8jdyCWFjaegU6VapHuiiHwtIoc9iNA6AJLjqz/tIxFXQiA
         mJWiK41GwLccLjSmD0LxL660ZO3vDf7wC2XyPTldrxvyNMcLMWKJzYQAvXYtjToy0bD1
         SxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516083; x=1796120883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihHHp6CHAYuyA3mpHXEe6HKUU0f2ZnmE4/lD0pXu6/o=;
        b=xrtP7mzzYt/8xwVwnR26yYADq/hs+XM+a9CKtX3wihW1WWgId1R5oTh4lVGppCN+0t
         xNTkBI/dEGQAs49rPP1PkGnAxRl3QE3tgCtBZjkt6MmXzikvkmJ8VQGe4UKFyudJSjkd
         WUvvl/nY62xq8TN6kjYWX0c7etyyD+kQPBhHIBZr6RGz+1bGRPr7RPWSfm6JrplGTTd7
         X/UcM+81Gnl5kQBBTVwZHj8UVKVB1Otox91+p0m+0/zlIWp94Tw+gfBbt1LfZjSkXmL+
         l2ie7LLNr1g/6IXP6cmsAfL6zrM+OOjZkECer2GATy+3zHRXKtr8kqB+rucECl+qG2/j
         lDbA==
X-Forwarded-Encrypted: i=1; AL+hErHINKIowDgSCa6FNGdI7JQaO8yC4G+vWdqZPP6YNWEgdGxKa+btlPwUi/FUZ/A41Up8hOxa2sE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9ZBMJNnQtgBzpKDBTgb7MEfhLDcQKSUI4uDSpeqJlR9JNsg7fY
	YDuGjGQvRY+yrfPEW6xKIUHalHgCrtGnAxewCco6KVI1UYoG13LZ/On0vEOCo0Dh7gA=
X-Gm-Gg: AZFdTZd99/qqs4akVqm/YUFt4SY5WaCwWmugNUqyvTgpECi+rgRsmvy9UxOdDTyilnt
	dwbFXEE8umHLKISua2dkBsg7akf3WBzN6JRKhes66OiKxMXSkyDzDybHFzzIyB0xp3dIyCYmRUz
	pWq8oMLpIIVDziIiACHikSC4OgLI8fOZJ62eHjRlEXbROqktVmruBL2gG8vqcTtrdxuaiUbNMT3
	FqSBUpKJtCD5HyWFgCPynzWpLJ35eLO9QWGR7pDQM5+4EYWa3g2qHabmSX4D+4wXUmTB+CFcY8n
	H5NcI2elujC4nkbQpAg31xkN1nz3E4BlFbRE57fsC9tR40hgD3W9SNUEFSEE9YZlOrf5WHuKaH+
	XS5mSU+NpA+xwe2j4+VIZyPegQPy67mlO9v3mFPwWJmM2AmEo8gt/R40BzEn84Vrl711fIx9ksS
	LrKnQMPSj09fILwdvaFbGufkYZwAtfJYults2cQxGF/TTwleKsAf+kjaYEuT+TQs/OjbnKeL8ja
	ZDCkaZyByvAlZ2RBvk7AObItXXBG5dsqA9VpXpVohYmBMI0sUd+fOOyIDBfy2i/TWKph6cmfVcr
	Fb7xFyfhn4hMrm6eJz2NvEkrAz2R6Cw=
X-Received: by 2002:a05:6000:29d5:b0:4aa:5833:c0fd with SMTP id ffacd0b85a97d-4abb58ec23cmr15948598f8f.52.1795516083446;
        Tue, 24 Nov 2026 02:28:03 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm26231621f8f.56.2026.11.24.02.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:28:03 -0800 (PST)
Date: Tue, 24 Nov 2026 11:28:01 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Avi Weiss <thnkslprpt@gmail.com>, Chris Down <chris@chrisdown.name>,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] printk: Fix skipped entries after index iterator restart
Message-ID: <awVmsdsIa9niLarO@pathway.suse.cz>
References: <20261116085609.476250-2-thnkslprpt@gmail.com>
 <avrJl4lYirh_7oQ-@ashevche-desk.local>
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
In-Reply-To: <avrJl4lYirh_7oQ-@ashevche-desk.local>

On Mon 2026-11-16 11:15:03, Andy Shevchenko wrote:
> On Mon, Nov 16, 2026 at 10:56:10AM +0200, Avi Weiss wrote:
> > seq_read_iter() can advance the iterator before the next record
> > fits in the read buffer. When iteration resumes, pi_start() calls
> > pi_next() at the saved position and advances past the pending printk
> > index entry. As a result, index reads can silently omit formats.
> > 
> > Return the entry corresponding to the saved position without
> > advancing the iterator.
> 
> ...
> 
> > -	return pi_next(s, NULL, pos);
> > +	return pi_get_entry(s->file->f_inode->i_private, *pos - 1);
> 
> Side note (because it seems used more in the same form), we have file_inode()
> helper and this should idiomatically look as
> 
> 	return pi_get_entry(file_inode(s->file)->i_private, *pos - 1);
>
> But I haven't checked if the file_inode() is recommended or deprecated API.

Good to know. But honestly, the variant with file_inode(s->file) looks
less readable to me. IMHO, it is not worth it.

Best Regards,
Petr
